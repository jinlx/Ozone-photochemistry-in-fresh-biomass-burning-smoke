import requests
import warnings
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy.io
import os
from pathlib import Path
from ConstantVal import *


def interp(df, standard_index):
    """
    Interpolates the values of all columns in a DataFrame to match a standard index.

    Parameters:
    df (DataFrame): The DataFrame whose values are to be interpolated.
    standard_index (Index): The new index values to which the DataFrame will be interpolated.

    Returns:
    DataFrame: A new DataFrame with interpolated values based on the standard_index.

    Description:
    This function takes a DataFrame and a set of standard index values. It interpolates the values of each column in the DataFrame to align with the standard index. This is particularly useful when synchronizing data across different data sets with varying indices.

    Usage:
    df_interpolated = interp(df_original, new_standard_index)
    where 'df_original' is the original DataFrame and 'new_standard_index' is the index to interpolate to.
    """
    standard_index = standard_index.astype(float)
    df_out = pd.DataFrame(index=standard_index)
    df_out.index.name = df.index.name
    old_index = np.array(df.index, dtype='float64')

    for colname, col in df.iteritems():
        col = np.array(col, dtype='float64')
        df_out[colname] = np.interp(standard_index, old_index, col)

    return df_out

def calculate_oh_chem_age_stats(voc_names, file_prefix, Flight_ID, chem_age):
    """
    Calculates OH concentrations using chemical parameters from VOCs and CO for both model and observations.

    Parameters:
    voc_names (list): List of VOC names to consider in the calculations.
    file_prefix (str): Prefix of the file paths where the data files are located.
    Flight_ID (str): Identifier for the specific flight or data collection event.
    chem_age (int): Indicator for whether to calculate chemical age (1 for yes, 0 for no).

    Returns:
    Tuple: Contains three DataFrames - summary of observational data, summary of model data, and model direct outputs.
    """
    # Initialize an empty DataFrame to store OH values
    Cal_OH_df_obs = pd.DataFrame()
    Cal_OH_df_mod = pd.DataFrame()
    for voc_name in voc_names:
        # Differnt VOC sets
        file_obs_voc = f'{file_prefix}{voc_name.replace(" ", "_")}/{Flight_ID}_obs_smk.csv'
        file_mod_voc = f'{file_prefix}{voc_name.replace(" ", "_")}/{Flight_ID}_mod_smk.csv'
        file_obs_co = f'{file_prefix}CO/{Flight_ID}_obs_smk.csv'
        file_mod_co = f'{file_prefix}CO/{Flight_ID}_mod_smk.csv'
        # read in data
        if Path(file_obs_voc).is_file() and Path(file_obs_co).is_file():
            df_voc_obs = pd.read_csv(file_obs_voc, index_col=0)
            df_voc_obs.index.name='Avg_physical_age_min'
            df_co_obs = pd.read_csv(file_obs_co, index_col=0)
            df_co_obs.index.name='Avg_physical_age_min'
            df_voc_mod = pd.read_csv(file_mod_voc, index_col=0)
            df_voc_mod.index.name='Avg_physical_age_min'
            df_co_mod = pd.read_csv(file_mod_co, index_col=0)
            df_co_mod.index.name='Avg_physical_age_min'
        else:
            df_dummy = pd.read_csv(f'{file_prefix}O3/{Flight_ID}_obs_smk.csv', index_col=0)            
            df_voc_obs = pd.DataFrame(0, index=df_dummy.index, columns = ['Observation'])
            df_co_obs = pd.DataFrame(0, index=df_dummy.index, columns = ['Observation'])  

        # Calculate OH level    
        k_OH_A, k_OH_B, ER_a_over_b= k_OH_dic[voc_name], k_OH_dic['CO'], ER_dic[voc_name]/ER_dic['CO']
        delta_t_obs, delta_t_mod = df_voc_obs.index.values, df_voc_mod.index.values
        A_obs, B_obs, A_mod, B_mod = df_voc_obs.values.T[0], df_co_obs.values.T[0], df_voc_mod['MCM + FUR'].values, df_co_mod['MCM + FUR'].values
        Cal_OH_obs, Cal_OH_mod = calculate_OH_avg(delta_t_obs*60, k_OH_A, k_OH_B, A_obs, B_obs, ER_a_over_b), \
                                    calculate_OH_avg(delta_t_mod*60, k_OH_A, k_OH_B, A_mod, B_mod, ER_a_over_b)
        # put data into the dataframe
        Cal_OH_df_obs[voc_name] =Cal_OH_obs 
        Cal_OH_df_mod[voc_name] =Cal_OH_mod

    # Clean up the data when the whole column is missing data.
    Cal_OH_df_obs = Cal_OH_df_obs.dropna(axis='columns', how='all')
    Cal_OH_df_mod = Cal_OH_df_mod.dropna(axis='columns', how='all')

    # Clean up the column when the column is five times larger or smaller than the median value 
    df_thresh, data_thresh = Cal_OH_df_obs.median(), Cal_OH_df_obs.median().median()
    col_filtered = []
    for column in df_thresh.index:
        if data_thresh/5 < df_thresh.loc[column] < 5*data_thresh: col_filtered.append(column)
    Cal_OH_df_obs, Cal_OH_df_mod = Cal_OH_df_obs[col_filtered], Cal_OH_df_mod[col_filtered]

    # Clean column when all values in the column is negative
    Cal_OH_df_obs, Cal_OH_df_mod = Cal_OH_df_obs.loc[:, ~(Cal_OH_df_obs < 0).all()], Cal_OH_df_mod.loc[:, ~(Cal_OH_df_mod < 0).all()]
    # Assign the index
    Cal_OH_df_obs.index, Cal_OH_df_mod.index= df_co_obs.index, df_co_mod.index
                                  
    # Clean row when all values in the row is negative
    if Flight_ID not in ['FN19']: 
        Cal_OH_df_obs, Cal_OH_df_mod = Cal_OH_df_obs[~(Cal_OH_df_obs < 0).all(axis=1)], Cal_OH_df_mod[~(Cal_OH_df_mod < 0).all(axis=1)]
        filtered_index_obs, filtered_index_mod = Cal_OH_df_obs.index, Cal_OH_df_mod.index
        df_co_obs, df_co_mod= df_co_obs.loc[filtered_index_obs], df_co_mod.loc[filtered_index_mod]    
    
    # Calculate the chemical time
    if chem_age==1:
        for column in Cal_OH_df_obs.columns: 
            Cal_OH_df_obs[column], Cal_OH_df_mod[column] = Cal_OH_df_obs.index * Cal_OH_df_obs[column]/1.5E6, Cal_OH_df_mod.index * Cal_OH_df_mod[column]/1.5E6  

    # Calculate mean and standard deviation for each row
    mean_values_obs, mean_values_mod = Cal_OH_df_obs.mean(axis=1), Cal_OH_df_mod.mean(axis=1)
    median_values_obs, median_values_mod = Cal_OH_df_obs.median(axis=1), Cal_OH_df_mod.median(axis=1)
    std_values_obs, std_values_mod = Cal_OH_df_obs.std(axis=1), Cal_OH_df_mod.std(axis=1)
    q1_values_obs, q1_values_mod = Cal_OH_df_obs.quantile(0.25, axis=1), Cal_OH_df_mod.quantile(0.25, axis=1)
    q3_values_obs, q3_values_mod = Cal_OH_df_obs.quantile(0.75, axis=1), Cal_OH_df_mod.quantile(0.75, axis=1)
    iqr_values_obs, iqr_values_mod = q3_values_obs - q1_values_obs, q3_values_mod - q1_values_mod

    # Create a new DataFrame to store the mean and standard deviation
    summary_df_obs, summary_df_mod = pd.DataFrame({'Mean': mean_values_obs, 'Std Dev': std_values_obs, 'Median': median_values_obs, 'IQR': iqr_values_obs}), \
                                    pd.DataFrame({'Mean': mean_values_mod, 'Std Dev': std_values_mod, 'Median': median_values_mod, 'IQR': iqr_values_mod})    
    
    # --------------------
    # Model direct outputs
    # --------------------
    df_compound_mod = pd.read_csv(f'{file_prefix}OH/{Flight_ID}_mod_smk.csv', index_col=0)
    df_compound_mod.index.name='Avg_physical_age_min'
    df_compound_mod = df_compound_mod*2.46*1e10
    
    # Calculate the chemical age 
    if chem_age == 1:
        for column in df_compound_mod.columns: df_compound_mod[column] = df_compound_mod.index * df_compound_mod[column]/1.5E6
        
    # return the output 
    return summary_df_obs, summary_df_mod, df_compound_mod

def calculate_OH_avg(delta_t, k_OH_A, k_OH_B, A, B, ER_a_over_b):
    """
    Calculate the average OH concentration based on the given formula.
    Reference:
    Palm, Brett B., et al. "Spatially resolved photochemistry impacts emissions estimates in fresh wildfire plumes." Geophysical Research Letters 48.23 (2021): e2021GL095443.
    
    Parameters:
    - delta_t: Time interval.
    - k_OH_A: Rate constant for the reaction of OH with species A.
    - k_OH_B: Rate constant for the reaction of OH with species B.
    - A: Concentration of species A at a given time.
    - B: Concentration of species B at a given time.
    - ER_a_over_b: ERa over ERb

    Returns:
    - OH_avg: Calculated average OH concentration.
    """
    OH_avg = (1 / (delta_t * (k_OH_A - k_OH_B))) * (np.log(ER_a_over_b) - np.log(A / B))
    return OH_avg

def bin_df(df_compound_mod, interval_X):
    """
    Bins a DataFrame based on a specified time interval and computes statistical measures for each bin.

    This function takes a DataFrame where the index represents time and groups the data into bins of a specified interval. 
    It computes the median, interquartile range (IQR), mean, and standard deviation for each bin.

    Parameters:
    df_compound_mod (DataFrame): A DataFrame with a time-based index.
    interval_X (int): The time interval for binning data, specified in the same units as the DataFrame index.

    Returns:
    DataFrame: A new DataFrame where each row represents a time bin, and columns include the median, IQR, mean, 
               and standard deviation of the original DataFrame's columns for that bin.
    """

    # Create bin edges for every X minutes, doulbe check if we want it to start with 0 or not...
    bin_edges = np.arange(0, df_compound_mod.index.max() + interval_X, interval_X)

    # Use the `cut` function to bin the data
    df_compound_mod['time_bin'] = pd.cut(df_compound_mod.index, bins=bin_edges, labels=bin_edges[:-1] + interval_X, right=False)
    
    # Group by the time bin and compute median, IQR, mean, and standard deviation for each bin
    binned_mod_stats = df_compound_mod.groupby('time_bin').agg(['median', iqr, 'mean', 'std'])

    # Drop rows where all elements are NaN
    binned_mod_stats = binned_mod_stats.dropna(how='all')    
    
    # Convert the index to numeric (if it's not already numeric)
    numeric_index = pd.to_numeric(binned_mod_stats.index, errors='coerce')

    # Check if the conversion was successful
    if numeric_index.isnull().any():
        print("Warning: Some index values could not be converted to numeric.")

    # Round the numeric index by converting to a Series first
    rounded_index = pd.Series(numeric_index).round(2)

    # Assign the rounded index back to the DataFrame
    binned_mod_stats.index = rounded_index

    # Return the binned statistics
    return binned_mod_stats

def iqr(x):
    """
    Standard Interquartile Range (IQR) Calculation.

    This function calculates the IQR of a given pandas Series or similar iterable object.
    The IQR is the difference between the 75th percentile (Q3) and the 25th percentile (Q1).

    Parameters:
    x (iterable): An iterable object (like a pandas Series) containing numerical data.

    Returns:
    float: The interquartile range of the data.
    """
    return x.quantile(0.75) - x.quantile(0.25)


def calculate_custom_IQR(df):
    """
    Custom Interquartile Range Calculation for Each Row in a DataFrame.

    This function calculates a custom IQR for each row of a DataFrame. Instead of using the standard 25th and 75th percentiles,
    it calculates Q1 as the average of the second and third smallest values and Q3 as the average of the second and third largest values in the row.

    Parameters:
    df (DataFrame): A pandas DataFrame where each row represents a separate data set for which the custom IQR will be calculated.

    Returns:
    Series: A pandas Series where the index matches the DataFrame's index and the values are the custom IQRs for each row.
    """
    IQR_values = {}
    for index, row in df.iterrows():
        # Sort the values for the current row
        sorted_values = row.sort_values(ascending=True)

        # Calculate Q1 as the average of the second and third smallest values
        second_smallest = sorted_values.iloc[1]
        third_smallest = sorted_values.iloc[2]
        Q1 = (second_smallest + third_smallest) / 2

        # Calculate Q3 as the average of the second and third largest values
        second_largest = sorted_values.iloc[-2]
        third_largest = sorted_values.iloc[-3]
        Q3 = (second_largest + third_largest) / 2

        # Calculate IQR as Q3 - Q1
        IQR = Q3 - Q1
        IQR_values[index] = IQR

    return pd.Series(IQR_values)


# ===================================================================
# Define a function to filter out extremelly off data
# Put lower bound and higher bound for percentage
# This is originally used to filter out intial data from F0AM outputs
# ===================================================================
def filter_df_by_first_column_percentiles(df, lower_bound_pct, upper_bound_pct):
    """
    Filters the DataFrame to keep only rows where the first column's values
    are between the 5th and 95th percentiles.

    :param df: Pandas DataFrame to filter.
    :return: Filtered DataFrame.
    """
    first_column = df.columns[0]
    lower_bound = df[first_column].quantile(lower_bound_pct)
    upper_bound = df[first_column].quantile(upper_bound_pct)

    return df[(df[first_column] >= lower_bound) & (df[first_column] <= upper_bound)]

# Example usage
# Assuming df is your DataFrame
# filtered_df = filter_df_by_first_column_percentiles(df)

def model_vs_model_evaluation(df_model1, df_model2, model1_name, model2_name, compound):
    """
    Calculate and return the mean absolute and relative differences between predictions of two different models.

    This function assesses the differences between predictions from two different models (model1 and model2) for a given compound. 
    It computes the mean absolute difference and the mean relative difference, providing metrics for model comparison.

    Parameters:
    - df_model1 (pd.Series): A pandas Series containing the predictions from the first model (model1).
    - df_model2 (pd.Series): A pandas Series containing the predictions from the second model (model2).
    - model1_name (str): The name of the first model used in the comparison.
    - model2_name (str): The name of the second model used in the comparison.
    - compound (str): The name of the compound for which the models are being compared.

    Returns:
    - abs_diff_mean (float): The mean absolute difference between the predictions of model1 and model2.
    - relative_diff_mean (float): The mean relative difference (as a percentage) between the predictions of model1 and model2.
    
    The relative difference is calculated as ((model1 - model2) / model2) * 100, which represents the percentage change 
    from model2 to model1. The results are printed to the console, indicating which model is being compared to which, 
    and also returned as output.

    Note: NaN values are ignored in the calculation of the mean differences. The function assumes that both model data
    inputs are aligned and comparable (i.e., they have the same index and corresponding entries).

    Example:
    >>> abs_diff_mean, relative_diff_mean = model_vs_model_evaluation(df_model1['O3'], df_model2['O3'], 'GEOS-Chem', 'MCM', 'Ozone')
    >>> print(abs_diff_mean, relative_diff_mean)
    """
    relative_diff_mean = (np.nanmean(df_model1) -  np.nanmean(df_model2))/ np.nanmean(df_model2) * 100
    abs_diff_mean = np.nanmean(df_model1) - np.nanmean(df_model2)
    if (abs(relative_diff_mean)) > 10 and (compound in Comps_in_GC):
        print(f'Difference for {compound} between {model1_name} and {model2_name}: {abs_diff_mean:.1f} ppb (Mean Absolute Difference), {relative_diff_mean:.0f}% (Mean Relative Difference)')
    return abs_diff_mean, relative_diff_mean


def evaluate_model_differences(df_obs, df_mod, poly_model, model_name, compound):
    """
    Calculate and return the mean absolute and relative differences between observed data and model predictions.

    This function compares a model's predictions against observed data that has been fitted with a polynomial model. 
    It calculates the mean absolute difference and the mean relative difference between the two datasets.

    Parameters:
    - df_obs (pd.DataFrame): A DataFrame containing the observed data.
    - df_mod (pd.DataFrame): A DataFrame containing the model predictions.
    - poly_model (np.poly1d): A polynomial model fitted to the observed data.

    Returns:
    - abs_diff_mean (float): The mean absolute difference between the model predictions and the observed data.
    - relative_diff_mean (float): The mean relative difference (as a percentage) between the model predictions and the observed data.
    
    The relative difference is calculated as ((model - observed) / observed) * 100, giving the percentage difference
    between the model predictions and the observed data. This can provide insights into the accuracy and bias of the model.
    
    Note: NaN values are ignored in the calculation of the mean differences.
    """
    obs_fit = poly_model(df_mod.index)
    relative_diff_mean = (np.nanmean(df_mod) - np.nanmean(obs_fit)) / np.nanmean(obs_fit) * 100
    abs_diff_mean = np.nanmean(df_mod) - np.nanmean(obs_fit)
    
    if abs(relative_diff_mean) > 10:
        if model_name == 'MCM + FUR' or (model_name in ['GEOS-Chem (base)', 'MCM + GEOS-Chem VOCs'] and compound in Comps_in_GC):
            print(f'Model bias in {model_name} for {compound}: {abs_diff_mean:.1f} ppb (Mean Absolute Difference), {relative_diff_mean:.0f}% (Mean Relative Difference)')

    return abs_diff_mean, relative_diff_mean
