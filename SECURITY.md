# Security Policy

## Supported release

Only the latest published stable MJMP release is supported.

## Verify downloads

Official binaries are published only through this repository's **GitHub Releases** page. Each release should include `SHA256SUMS.txt` beside `MJMPv1.exe` so the executable can be verified before running it.

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

## Reporting a vulnerability

Use GitHub's private vulnerability reporting / Security Advisory mechanism for this repository when available. Please do not publish exploit details in a public issue before the report has been reviewed.
