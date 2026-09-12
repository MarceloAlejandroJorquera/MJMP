<h1 align="center">MJMP</h1>

<p align="center"><strong>Portable x64 Windows multimedia player focused on broad format support, responsive playback and GPU-accelerated presentation.</strong></p>

<p align="center">
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP/releases/latest"><strong>Download latest release</strong></a>
  ·
  <a href="CHANGELOG.md">Changelog</a>
  ·
  <a href="SECURITY.md">Security</a>
</p>

<p align="center"><code>Single EXE</code> · <code>No installer</code> · <code>No codec pack required</code> · <code>Windows x64</code></p>

---

## Overview

MJMP is distributed as a **single portable executable**: `MJMPv1.exe`.
The media stack is linked into the application, so users do not need to install FFmpeg, codec packs, OpenMPT, dav1d, VVdeC, or the Microsoft Visual C++ Redistributable separately.

On a fresh configuration, MJMP starts **maximized** and selects the **D3D11 renderer** for compatibility. D3D12 remains available as an optional renderer.

| Area | Highlights |
| --- | --- |
| **Distribution** | Portable `MJMPv1.exe`; no installer or external codec pack |
| **Rendering** | D3D11 compatibility path + optional D3D12 path |
| **Output precision** | 8-bit UNORM, 10-bit RGB, 16-bit-float scRGB |
| **Playback** | Source-rate / unlocked presentation modes, seeking, frame/file controls |
| **Audio** | WASAPI output with bundled decode/conversion paths |
| **Subtitles** | Embedded/sidecar subtitle support with configurable styling and preview |
| **Tray** | Live playback preview, transport controls, pinning and fullscreen expansion |
| **Library workflow** | Playlist, history, hotkeys and configurable interface visibility |
| **Updates** | Optional GitHub release check from **Options → Player → Check new versions** |

---

<h2 align="center">Player</h2>

<p align="center">
  <img src="docs/screenshots/01-player/01-main-player-context-menu.png" alt="MJMP main player and context menu" width="1100">
</p>
<p align="center"><em>Main player window with the custom context menu.</em></p>

<h3 align="center">Tray playback</h3>

<p align="center">
  <img src="docs/screenshots/01-player/02-tray-preview.png" alt="MJMP tray playback preview" width="520">
</p>
<p align="center"><em>Compact tray preview with playback controls, fullscreen expansion and pinning.</em></p>

---

<h2 align="center">Options</h2>

<h3 align="center">Player</h3>
<p align="center">
  <img src="docs/screenshots/02-options/01-player.png" alt="MJMP Player options" width="1100">
</p>

<h3 align="center">Playback</h3>
<p align="center">
  <img src="docs/screenshots/02-options/02-playback.png" alt="MJMP Playback options" width="1100">
</p>

<h3 align="center">Video</h3>
<p align="center">
  <img src="docs/screenshots/02-options/03-video.png" alt="MJMP Video options" width="1100">
</p>

<h3 align="center">Subtitles</h3>
<p align="center">
  <img src="docs/screenshots/02-options/04-subtitles.png" alt="MJMP Subtitle options" width="1100">
</p>

<h3 align="center">Hotkeys</h3>
<p align="center">
  <img src="docs/screenshots/02-options/05-hotkeys.png" alt="MJMP Hotkey options" width="1100">
</p>

---

## Download and run

1. Open the [latest release](https://github.com/MarceloAlejandroJorquera/MJMP/releases/latest).
2. Download **`MJMPv1.exe`** and **`SHA256SUMS.txt`**.
3. Optionally verify the binary checksum using the instructions below.
4. Run `MJMPv1.exe` directly. No installation step is required.

> Windows may show its normal reputation/security prompt for a newly published unsigned executable. Always download MJMP from this repository's Releases page and verify the checksum when desired.

## Release integrity

Every release should provide these two assets:

- `MJMPv1.exe`
- `SHA256SUMS.txt`

Verify the executable in PowerShell:

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The SHA-256 value printed by `Get-FileHash` must match the hash on the `MJMPv1.exe` line in `SHA256SUMS.txt`.

## Update checks

When **Check new versions** is enabled under **Options → Player**:

- the first check occurs about **10 seconds after startup**;
- a long-running MJMP session rechecks about **every 6 hours**;
- network work is asynchronous and does not block playback or the UI;
- the same available release is notified only once per process session;
- MJMP opens the GitHub release page but does **not** automatically download or execute an update.

The option can be disabled at any time.

## Public versioning

MJMP public versions use progressively extended numeric components:

```text
1
1.1
1.1.1
1.1.1.1
1.1.1.2
```

GitHub release tags use the corresponding `v` prefix: `v1`, `v1.1`, `v1.1.1`, and so on.

## System requirements

- 64-bit Windows 10 or Windows 11
- Working Windows audio stack
- D3D11-capable GPU and driver for the default compatibility renderer
- D3D12-capable GPU and driver when selecting the D3D12 renderer

## Repository scope

This is the **public binary-release repository** for MJMP. It contains release documentation and screenshots. The application binary is published through **GitHub Releases** rather than committed to the repository tree. Private source/build trees are not included here.

## Security

For vulnerability reporting, see [SECURITY.md](SECURITY.md).

## License

See [LICENSE.txt](LICENSE.txt).
