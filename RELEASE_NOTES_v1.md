# MJMP v1

MJMP v1 is the initial public binary release for **64-bit Windows**.

## Release assets

The release should contain exactly:

```text
MJMPv1.exe
SHA256SUMS.txt
```

`MJMPv1.exe` is the portable application. `SHA256SUMS.txt` contains the SHA-256 checksum for that exact release executable.

## Highlights

- Portable single-file distribution
- No installer
- No external codec pack
- Static MSVC runtime
- FFmpeg 9.0.1 media stack
- D3D11 default renderer
- Optional D3D12 renderer
- 8-bit, 10-bit and 16-bit-float output allocation modes
- WASAPI audio output
- dav1d AV1 path
- VVdeC VVC / H.266 path
- libopenmpt tracker/module support
- Embedded artwork and subtitle infrastructure
- Tray playback preview
- Playlist/history workflows
- Configurable hotkeys and interface visibility
- GitHub release update checks

## Run

Download `MJMPv1.exe` from the GitHub Release assets and run it directly.

No installation step is required.

## Verify the release

Download both release assets into the same directory and run:

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The SHA-256 values must match.

## Update checking

When **Check new versions** is enabled under **Options → Player**, MJMP checks this repository for a newer published release. It does not automatically download or execute updates.

## Requirements

- 64-bit Windows 10 or Windows 11
- D3D11-capable GPU/driver for the default renderer
- D3D12-capable GPU/driver when selecting D3D12
- Working Windows audio stack
