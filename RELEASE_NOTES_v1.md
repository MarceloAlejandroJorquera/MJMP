# MJMP v1

Initial public release of MJMP for 64-bit Windows.

### Installation

No installer is required. Download `MJMPv1.exe` and run it.

### Dependencies

MJMP is distributed as a portable single executable. No external codec pack or Visual C++ Redistributable installation is required.

### Integrity

The release also includes `SHA256SUMS.txt`. Verify the downloaded executable with PowerShell:

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
```
