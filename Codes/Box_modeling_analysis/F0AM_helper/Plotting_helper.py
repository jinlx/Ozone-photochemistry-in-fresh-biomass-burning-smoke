# Modules
import numpy as np
from pathlib import Path
import os
import matplotlib.ticker as mticker


# ===========================================================================================
# Function: reorderLegend
# Description: 
#   Reorders the legend entries of a matplotlib plot. It can also make the legend entries unique.
# Parameters:
#   ax - The axis for which the legend needs reordering. If not provided, uses current axis.
#   order - Optional list to specify the order of labels.
#   unique - If True, ensures each label is only shown once in the legend.
# Returns:
#   A tuple of handles and labels in the specified order.
# ===========================================================================================
def reorderLegend(ax=None,order=None,unique=False):
    if ax is None: ax=plt.gca()
    handles, labels = ax.get_legend_handles_labels()
    labels, handles = zip(*sorted(zip(labels, handles), key=lambda t: t[0])) # sort both labels and handles by labels
    if order is not None: # Sort according to a given list (not necessarily complete)
        keys=dict(zip(order,range(len(order))))
        labels, handles = zip(*sorted(zip(labels, handles), key=lambda t,keys=keys: keys.get(t[0],np.inf)))
    if unique:  labels, handles= zip(*unique_everseen(zip(labels,handles), key = labels)) # Keep only the first of each handle
    ax.legend(handles, labels)
    return(handles, labels)

# ===========================================================================================
# Function: unique_everseen
# Description: 
#   Iterates over an ordered sequence, keeping elements only the first time they appear.
# Parameters:
#   seq - The sequence to filter for unique elements.
#   key - Optional key function to identify uniqueness.
# Returns:
#   A list of unique elements in their first occurrence order.
# ===========================================================================================
def unique_everseen(seq, key=None):
    seen = set()
    seen_add = seen.add
    return [x for x,k in zip(seq,key) if not (k in seen or seen_add(k))]

# ===========================================================================================
# Function: calculate_diff_and_format
# Description: 
#   Calculates the difference and relative difference between model data and a polynomial model function.
# Parameters:
#   df_mod - DataFrame containing model data.
#   model_name - Column name in the DataFrame for which the difference is to be calculated.
#   poly_model_func - Polynomial function used for comparison.
# Returns:
#   A formatted string representing the median absolute and relative differences.
# ===========================================================================================
def calculate_diff_and_format(df_mod, model_name, poly_model_func):
    relative_diff = (df_mod[model_name] - poly_model_func(df_mod.index)) / poly_model_func(df_mod.index) * 100
    abs_diff = df_mod[model_name] - poly_model_func(df_mod.index)
    relative_diff_median = np.nanmedian(relative_diff)
    abs_diff_median = np.nanmedian(abs_diff)
    diff_str = f'{abs_diff_median:.0f}ppb ({relative_diff_median:.0f}%)'
    return diff_str

# ===========================================================================================
# Function: autopct_threshold
# Description: 
#   Generates a function for conditional display of percentage labels in matplotlib pie charts.
# Parameters:
#   threshold - Minimum percentage value for displaying the label.
# Returns:
#   A function that takes a percentage and returns a formatted string if above the threshold.
# ===========================================================================================
def autopct_threshold(threshold):
    def inner_autopct(pct):
        return f'{int(pct)}%' if pct > threshold else ''
    return inner_autopct



# ===========================================================================================
# Function: format_sci
# Purpose:
#   Converts a number into its scientific notation representation.
#   The function takes a floating-point number and returns a string
#   in the format 'a x 10^b', where 'a' is the mantissa and 'b' is the exponent.
#
# Parameters:
#   n (float): The number to be converted into scientific notation.
#
# Returns:
#   str: A string representing the number in scientific notation.
#
# Example:
#   format_sci(1234) would return "1.2 x 10^3".
# ===========================================================================================
def format_sci(n):
    # Split the number into mantissa and exponent using scientific notation formatting
    mantissa, exponent = f"{n:.1e}".split('e')

    # Convert the mantissa and exponent to their respective data types
    mantissa = float(mantissa)
    exponent = int(exponent)

    # Return the formatted string representing scientific notation
    return f"${mantissa:.1f} \\times 10^{{{exponent}}}$"
