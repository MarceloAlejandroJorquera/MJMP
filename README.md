# MJMP

MJMP is a portable x64 Windows multimedia player distributed as a **single executable**.

## Download

Use the **Releases** section of this repository and download `MJMPv1.exe` from the latest release.

No codec pack, FFmpeg installation, Visual C++ Redistributable, OpenMPT installation, dav1d installation, or VVdeC installation is required. The media stack used by MJMP is linked into the executable; Windows graphics, audio, networking, and shell components are supplied by the operating system.

## Requirements

- 64-bit Windows 10 or Windows 11
- A working Windows audio stack
- A D3D11-capable GPU/driver for the compatibility renderer
- D3D12-capable hardware/driver only when selecting the D3D12 renderer

MJMP starts with the **D3D11 renderer** on a fresh configuration for broad compatibility.

## Updates

MJMP can check this repository for new releases. The default policy is deliberately low-frequency:

- first check: **10 seconds after startup**, so networking does not compete with cold media/presenter initialization;
- while MJMP stays open: **every 6 hours**;
- requests are asynchronous and never block playback/UI;
- the same available release is notified only once per application session;
- MJMP does **not** automatically download or execute an update;
- the check can be disabled under **Options → Player → Check new versions**.

The program reads GitHub's latest non-draft, non-prerelease release and compares its tag with the installed public version. Release tags must use the numeric versioning scheme below.

## Versioning

Public versions use progressively extended numeric components:

- `1`
- `1.1`
- `1.1.1`
- `1.1.1.1`
- `1.1.1.2`

Git tags/releases should use the corresponding `v` prefix, for example `v1`, `v1.1`, or `v1.1.1.1`.

## Integrity

Each release should publish:

- `MJMPv1.exe`
- `SHA256SUMS.txt`

Verify the executable with PowerShell:

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
```

Compare the result with the hash in `SHA256SUMS.txt` attached to the same GitHub release.

## Repository scope

This repository is intended for **binary releases and release documentation only**. Source code and build dependency trees are not part of the public repository.
