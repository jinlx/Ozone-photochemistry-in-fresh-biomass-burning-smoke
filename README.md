# OH Production and Timescale Analysis in Wildfire Smoke

This repository contains the analysis code used to diagnose OH production, loss, and
timescales in wildfire smoke using observations, GEOS-Chem, and MCM-based box modeling.

The workflow supports two reproducibility paths:
1. Fast reproduction from processed datasets (recommended)
2. Full reproduction from raw inputs

---

## Repository structure

project/
├── notebooks/
│   └── OH_TS_Prod_v13_fig.ipynb
├── processed_data/
│   ├── all_data_obs.csv.gz
│   ├── all_data_gc.csv.gz
│   ├── all_data_mcm_gcvoc.csv.gz
│   └── all_data_mcm_bbvoc.csv.gz
├── environment.yml
└── README.md

---

## Fast reproduction (recommended)

1. Create the Conda environment:
   conda env create -f environment.yml
   conda activate oh-smoke

2. Ensure processed_data/ contains all all_data_*.csv.gz files.

3. Open the notebook and set:
   USE_PROCESSED = True

4. Run all cells to reproduce figures and analysis.

---

## Full reproduction

Set USE_PROCESSED = False and ensure raw data are available as expected by the notebook.

---

## Software environment

Python >= 3.10. Exact package versions are listed in environment.yml.

---

## Contact

Lixu Jin  
Rutgers University
