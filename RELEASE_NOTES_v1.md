# MJMP v1

Initial public release of MJMP for 64-bit Windows.

## Highlights

- Portable single-file distribution: `MJMPv1.exe`
- No installer required
- No external codec pack required
- No Visual C++ Redistributable installation required
- D3D11 compatibility renderer with optional D3D12 renderer
- Tray playback preview and transport controls
- Configurable playback, subtitles, renderer/output precision, visibility, and hotkeys
- Built-in GitHub release checking, configurable under **Options → Player → Check new versions**

## Installation

Download `MJMPv1.exe` from the GitHub Release assets and run it.

## Integrity

When `SHA256SUMS.txt` is attached to the release, verify the executable with PowerShell:

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
```

Compare the resulting hash with the value published in `SHA256SUMS.txt`.
