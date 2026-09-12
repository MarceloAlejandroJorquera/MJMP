# Security Policy

## Supported releases

Only the latest published stable MJMP release is supported.

## Download integrity

Official MJMP binaries are distributed through this repository's **GitHub Releases** page.

Each release is intended to provide:

```text
MJMPv1.exe
SHA256SUMS.txt
```

Users can verify the executable with:

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The values must match.

## Reporting a vulnerability

Use GitHub's private vulnerability reporting / Security Advisory mechanism for this repository when available.

Please do not publish exploit details in a public issue before the report has been reviewed.
