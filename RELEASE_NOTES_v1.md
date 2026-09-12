<h1 align="center">MJMP v1</h1>

<p align="center"><strong>First public release of MJMP for 64-bit Windows.</strong></p>

## Highlights

- **Portable:** one `MJMPv1.exe`, no installer required.
- **Self-contained playback stack:** no external codec pack required.
- **Compatibility first:** D3D11 is selected by default on a fresh configuration, with D3D12 available optionally.
- **Output precision choices:** 8-bit UNORM, 10-bit RGB and 16-bit-float scRGB.
- **Tray workflow:** live preview, transport controls, fullscreen expansion and pinning.
- **Subtitles:** configurable styling with a live preview.
- **Player workflow:** playlist/history, hotkeys, visibility controls and playback preferences.
- **Update awareness:** optional GitHub release checking under **Options → Player → Check new versions**.

## Release assets

Download both files from the release:

- `MJMPv1.exe`
- `SHA256SUMS.txt`

## Integrity verification

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The hashes must match.

## Installation

There is no installer. Place `MJMPv1.exe` wherever you want and run it directly.

## Full changelog

See [CHANGELOG.md](CHANGELOG.md).
