# Ozone photochemistry in fresh biomass burning smoke over the United States

Code and processed datasets to reproduce the key analysis and figures for the *Science Advances* paper:

**Title:** Ozone photochemistry in fresh biomass burning smoke over the United States  
**Authors:** Lixu Jin et al.  
**Journal:** Science Advances (2026)  
**Paper DOI:** [add when available]

## Data availability (processed datasets)

Processed, analysis-ready datasets used for the fast-reproduction workflow are archived on Zenodo:  
**Zenodo DOI:** https://doi.org/10.5281/zenodo.18226363

This repository focuses on diagnosing photochemical oxidant production and related metrics in **fresh wildfire smoke** using observational constraints and MCM-based box-model calculations.

## Reproducibility options

Two workflows are supported:

1. **Fast reproduction (recommended):** run the notebook using the processed datasets (download from Zenodo or place them in `processed_data/`).
2. **Full reproduction:** regenerate processed datasets from raw inputs. Due to data volume and/or data-use constraints, the complete raw-input and processing package is not distributed via GitHub and Zenodo; please contact the authors for access.

## Repository structure

```text
project/
├── notebooks/
│   └── OH_TS_Prod_v13_fig.ipynb
├── processed_data/              # optional local copy (download from Zenodo)
│   ├── all_data_obs.csv.gz
│   ├── all_data_gc.csv.gz
│   ├── all_data_mcm_gcvoc.csv.gz
│   └── all_data_mcm_bbvoc.csv.gz
├── environment.yml
└── README.md
```

## Fast reproduction (recommended)

1. Create the Conda environment:
   conda env create -f environment.yml
   conda activate oh-smoke

2. Ensure processed_data/ contains all all_data_*.csv.gz files.

3. Open the notebook and set:
   USE_PROCESSED = True

4. Run all cells to reproduce figures and analysis.

## Full reproduction

Contact the authors for access due to data volume and/or data-use constraints.

## Software environment

Python >= 3.10. Exact package versions are listed in environment.yml.

## Contact

Lixu Jin (lixu.jin@umontana.edu/jinlx15@outlook.com)
