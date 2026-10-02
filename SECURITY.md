# Security Policy

## Supported releases

Only the latest published stable MJMP release is supported.

## Download integrity

Official MJMP binaries are distributed through this repository's **GitHub Releases** page.

For v1.1.1.1, download the portable archive and its generated checksum data:

```text
MJMPv1.1.1.1.zip
MJMPv1.1.1.1.zip.sha256
SHA256SUMS.txt
```

Verify the archive with:

```powershell
Get-FileHash .\MJMPv1.1.1.1.zip -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The values must match. The ZIP contains the portable `MJMPv1.1.1.1.exe`.

## Reporting a vulnerability

Use GitHub's private vulnerability reporting / Security Advisory mechanism for this repository when available.

Please do not publish exploit details in a public issue before the report has been reviewed.
