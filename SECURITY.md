# Security policy

## Never commit credentials

Do not commit MATLAB Connector certificates, private-key bundles, MATLAB settings, API tokens, passwords, `.env` files, or other machine-local authentication material. Examples include `.p12`, `.pfx`, `.pem`, `.key`, `.crt`, `.cer`, and `.mlsettings` files.

## If a credential is exposed

1. Revoke or rotate it in the system that issued it (MATLAB/MathWorks or the relevant connector/service).
2. Assume the exposed credential is compromised, even if the file is later deleted.
3. Remove the file from every branch and tag in Git history.
4. Ask collaborators to discard old clones or follow the history-cleanup instructions.
5. Add a regression check before the next release.

For a suspected exposure, contact the repository owner privately through GitHub. Do not paste the credential into an issue or pull request.
