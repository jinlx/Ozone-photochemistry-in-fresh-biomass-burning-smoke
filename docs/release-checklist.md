# Public-release checklist

## Security

- [ ] No `.p12`, `.pfx`, `.pem`, `.key`, `.crt`, `.cer`, `.mlsettings`, `.env`, token, password, or private endpoint is present in the working tree.
- [ ] A history-wide search has been run for sensitive filenames and credential patterns.
- [ ] Any exposed credential has been revoked or rotated before pushing a rewrite.
- [ ] The repository's `.gitignore` prevents recurrence.

## Data and size

- [ ] Raw inputs and full model outputs are outside the public code repository.
- [ ] Processed-data files have a version, checksum, provenance, and DOI.
- [ ] Notebook checkpoints, Python caches, editor files, and accidental generated outputs are absent.
- [ ] Large binaries are intentionally versioned or moved to an appropriate data/archive service.

## Reproducibility

- [ ] `environment.yml` or a lockfile is updated.
- [ ] The fast reproduction notebook runs from a fresh clone with the documented Zenodo files.
- [ ] The release records the commit, data DOI/version, and model/mechanism revisions.
- [ ] `CITATION.cff` and third-party notices are current.
