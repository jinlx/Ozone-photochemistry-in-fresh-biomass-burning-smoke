# Ozone photochemistry in fresh biomass burning smoke over the United States

Code and processed datasets for the *Science Advances* paper:

> Lixu Jin et al. (2026), "Ozone photochemistry in fresh biomass burning smoke over the United States," *Science Advances*, 12(6), eads2157.

- Paper DOI: <https://doi.org/10.1126/sciadv.ads2157>
- Processed-data DOI: <https://doi.org/10.5281/zenodo.18226363>

## Scope and public/private boundary

This repository contains the public code, notebooks, environment description, and processed datasets needed for the fast-reproduction workflow. It focuses on photochemical oxidant production in fresh wildfire smoke using observational constraints and MCM/F0AM-based box-model calculations.

The complete raw-input and processing package is not distributed here because of data volume and/or data-use restrictions. Raw observations, full model outputs, and local working files should remain in the approved private archive or a separately documented data release.

MATLAB Connector certificates, private keys, MATLAB settings files, tokens, and passwords are never part of this project. Keep them outside the repository. See [`SECURITY.md`](SECURITY.md).

## Reproducibility options

1. **Fast reproduction (recommended):** download the processed datasets from Zenodo, place them under `processed_data/`, set `USE_PROCESSED = True` in the notebook, and run the notebook from top to bottom.
2. **Full reproduction:** regenerate the processed datasets from the raw inputs. Contact the authors for access and the required data-use instructions.

## Repository structure

```text
.
|-- Codes/
|   |-- matlab/                  # F0AM source, chemistry, mechanisms, and MATLAB setups
|   `-- Box_modeling_analysis/   # Python analysis, preprocessing, and plotting workflows
|-- notebooks/                   # Public fast-reproduction notebook(s)
|-- processed_data/              # Optional local copy of the Zenodo datasets
|-- Respnse/                     # Legacy directory name; do not rename without checking links
|-- environment.yml              # Conda environment specification
|-- CITATION.cff                 # Machine-readable paper citation
|-- NOTICE.md                    # Third-party and data-product notices
`-- docs/                        # Security and release guidance
```

## Fast reproduction

1. Create the Conda environment:

   ```bash
   conda env create -f environment.yml
   conda activate oh-smoke
   ```

2. Download the four processed files from Zenodo and place them in `processed_data/`:

   ```text
   all_data_obs.csv.gz
   all_data_gc.csv.gz
   all_data_mcm_gcvoc.csv.gz
   all_data_mcm_bbvoc.csv.gz
   ```

3. Open `notebooks/OH_TS_Prod_v13_fig.ipynb` and set:

   ```python
   USE_PROCESSED = True
   ```

4. Run all cells and save generated figures outside the repository unless they are intentionally selected as release assets.

## Software environment

The current `environment.yml` specifies Python 3.10 and the scientific Python packages used by the fast workflow. It is an environment specification rather than a fully locked solve; record the resolved package versions with each analysis release.

## Citation

Please cite the paper and the Zenodo data release when using this repository. See [`CITATION.cff`](CITATION.cff) for machine-readable citation metadata.

## Security and release hygiene

Before every public release, follow [`docs/release-checklist.md`](docs/release-checklist.md). In particular, do not commit `.p12`, `.pem`, `.mlsettings`, `.key`, `.crt`, `.cer`, `.env`, checkpoint, cache, or editor files. Removing a credential from the latest commit is not sufficient if it was previously published; rotate it first and purge the affected history.

## Contact

For access to the full-reproduction inputs or questions about the paper-specific workflow, contact the authors through the publication or the repository owner.
