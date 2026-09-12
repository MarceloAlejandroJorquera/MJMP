<h1 align="center">MJMP</h1>

<p align="center">
  <strong>High-performance portable x64 Windows multimedia player with broad codec support and GPU-accelerated playback.</strong>
</p>

<p align="center">
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP/releases/latest">
    <img alt="Latest release" src="https://img.shields.io/github/v/release/MarceloAlejandroJorquera/MJMP?label=release&sort=semver&color=2ea043">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP/releases">
    <img alt="Status Stable" src="https://img.shields.io/badge/status-stable-2ea043">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="Platform Windows x64" src="https://img.shields.io/badge/platform-Windows%20x64-0078D4">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="Language C++23" src="https://img.shields.io/badge/language-C%2B%2B23-00599C">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="Compiler MSVC 19.51" src="https://img.shields.io/badge/compiler-MSVC%2019.51-5C2D91">
  </a>
</p>

<p align="center">
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="D3D11 Default" src="https://img.shields.io/badge/renderer-D3D11%20default-4B8BBE">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="D3D12 Available" src="https://img.shields.io/badge/renderer-D3D12%20available-6f42c1">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="FFmpeg 9.0.1" src="https://img.shields.io/badge/media-FFmpeg%209.0.1-7E2D2D">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="AV1 dav1d" src="https://img.shields.io/badge/AV1-dav1d-00897B">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="VVC VVdeC" src="https://img.shields.io/badge/VVC%20%2F%20H.266-VVdeC-8E44AD">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="Tracker modules libopenmpt" src="https://img.shields.io/badge/modules-libopenmpt-3A6EA5">
  </a>
</p>

<p align="center">
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP">
    <img alt="Audio WASAPI" src="https://img.shields.io/badge/audio-WASAPI-0067B8">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP/releases">
    <img alt="Portable single EXE" src="https://img.shields.io/badge/distribution-portable%20single%20EXE-444444">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP/releases">
    <img alt="SHA-256 release integrity" src="https://img.shields.io/badge/integrity-SHA--256-CB6D17">
  </a>
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP/releases">
    <img alt="GitHub release update checks" src="https://img.shields.io/badge/update%20checks-GitHub%20Releases-24292F">
  </a>
</p>

<p align="center">
  <a href="https://github.com/MarceloAlejandroJorquera/MJMP/releases/latest"><strong>Download latest release</strong></a>
  &nbsp;·&nbsp;
  <a href="CHANGELOG.md">Changelog</a>
  &nbsp;·&nbsp;
  <a href="SECURITY.md">Security</a>
</p>

<p align="center">
  <code>Single EXE</code>
  ·
  <code>No installer</code>
  ·
  <code>No codec pack required</code>
  ·
  <code>Windows x64</code>
</p>

---

## Overview

**MJMP** is a portable Windows multimedia player distributed as a **single executable**: `MJMPv1.exe`.

Its media stack is linked into the application, so users do not need to separately install FFmpeg, codec packs, libopenmpt, dav1d, VVdeC, or the Microsoft Visual C++ Redistributable.

On a fresh configuration, MJMP starts **maximized** and selects **D3D11 by default** for broad compatibility. **D3D12** remains available as an optional renderer for capable systems.

| Area | Highlights |
| --- | --- |
| **Distribution** | Portable `MJMPv1.exe`; no installer; no external codec pack |
| **Rendering** | D3D11 compatibility path + optional D3D12 path |
| **Output precision** | 8-bit UNORM, 10-bit RGB, 16-bit-float scRGB |
| **Playback** | Source-rate / unlocked presentation modes, seeking, frame/file controls |
| **Audio** | WASAPI output with bundled decoding and conversion paths |
| **Subtitles** | Embedded and sidecar subtitle support with configurable styling and preview |
| **Tray** | Live playback preview, transport controls, pinning and fullscreen expansion |
| **Library workflow** | Playlist, history, regex search, hotkeys and configurable interface visibility |
| **Updates** | Optional GitHub release checks from **Options → Player → Check new versions** |
| **Integrity** | SHA-256 manifest published beside each release binary |

---

<h2 align="center">Player</h2>

<p align="center">
  <img src="docs/screenshots/01-player/01-main-player-context-menu.png" alt="MJMP main player and context menu" width="1100">
</p>

<p align="center">
  <em>Main player window with MJMP's custom context menu and playback interface.</em>
</p>

<h3 align="center">Tray playback</h3>

<p align="center">
  <img src="docs/screenshots/01-player/02-tray-preview.png" alt="MJMP tray playback preview" width="520">
</p>

<p align="center">
  <em>Compact tray preview with playback controls, fullscreen expansion and pinning.</em>
</p>

---

<h2 align="center">Options</h2>

<p align="center">
  MJMP exposes renderer, playback, subtitle, interface and hotkey configuration through a custom native Options interface.
</p>

<h3 align="center">Player</h3>

<p align="center">
  <img src="docs/screenshots/02-options/01-player.png" alt="MJMP Player options" width="1100">
</p>

<p align="center">
  <em>General player behavior, interface visibility and update-check controls.</em>
</p>

<h3 align="center">Playback</h3>

<p align="center">
  <img src="docs/screenshots/02-options/02-playback.png" alt="MJMP Playback options" width="1100">
</p>

<p align="center">
  <em>Playback behavior, timing and media-navigation configuration.</em>
</p>

<h3 align="center">Video</h3>

<p align="center">
  <img src="docs/screenshots/02-options/03-video.png" alt="MJMP Video options" width="1100">
</p>

<p align="center">
  <em>Renderer selection, presentation mode and output-precision controls.</em>
</p>

<h3 align="center">Subtitles</h3>

<p align="center">
  <img src="docs/screenshots/02-options/04-subtitles.png" alt="MJMP Subtitle options" width="1100">
</p>

<p align="center">
  <em>Subtitle appearance and rendering configuration.</em>
</p>

<h3 align="center">Hotkeys</h3>

<p align="center">
  <img src="docs/screenshots/02-options/05-hotkeys.png" alt="MJMP Hotkey options" width="1100">
</p>

<p align="center">
  <em>Configurable keyboard shortcuts for playback, navigation and interface actions.</em>
</p>

---

## Download and run

1. Open the [latest release](https://github.com/MarceloAlejandroJorquera/MJMP/releases/latest).
2. Download **`MJMPv1.exe`** and **`SHA256SUMS.txt`**.
3. Optionally verify the executable using the SHA-256 instructions below.
4. Run `MJMPv1.exe` directly.

No installation step is required.

> [!NOTE]
> Windows may display its normal reputation/security prompt for a newly published unsigned executable. Download MJMP only from this repository's **Releases** page and verify the published SHA-256 checksum when desired.

---

## Release integrity

Every release is intended to provide:

```text
MJMPv1.exe
SHA256SUMS.txt
```

Verify the executable in PowerShell:

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The SHA-256 value returned by `Get-FileHash` must match the `MJMPv1.exe` entry in `SHA256SUMS.txt`.

Example manifest format:

```text
<sha256>  MJMPv1.exe
```

---

## Portable dependency model

MJMP is built to keep its media/runtime dependencies inside the executable.

The release build statically links the project's media components, including the FFmpeg media stack, dav1d AV1 decoding, VVdeC VVC/H.266 decoding, libopenmpt tracker/module support, and the MSVC runtime.

The resulting executable dynamically imports only normal Windows system components such as Direct3D, DXGI, DWM, WASAPI-related Windows APIs, User32/GDI, cryptography and shell libraries.

This means users do **not** need to install:

- FFmpeg
- LAV Filters
- K-Lite or another codec pack
- dav1d
- VVdeC
- libopenmpt
- vcpkg
- Visual Studio
- the Microsoft Visual C++ Redistributable

---

## Rendering

### D3D11

D3D11 is the default renderer on a fresh configuration and is intended to provide the broadest compatibility.

### D3D12

D3D12 is available as an optional renderer on supported hardware and drivers.

MJMP supports multiple real output-precision paths:

- **8-bit UNORM**
- **10-bit RGB**
- **16-bit-float scRGB**

Actual results depend on source material, Windows composition, display configuration, GPU capabilities and driver support.

---

## Media support

MJMP uses its bundled FFmpeg-based media stack together with specialized decoding paths where applicable.

Current media infrastructure includes:

- FFmpeg demuxing and native codec support
- H.264 / AVC
- H.265 / HEVC
- VP8 / VP9
- AV1 through bundled dav1d support
- VVC / H.266 through bundled VVdeC support
- AAC, MP3, FLAC, ALAC, Opus, Vorbis
- AC-3, E-AC-3, TrueHD and DTS-family paths
- WavPack, APE and TTA
- tracker/module formats through libopenmpt
- embedded artwork
- embedded and sidecar subtitles

Support can vary by media profile, container and hardware-acceleration capability.

---

## Update checks

When **Check new versions** is enabled under **Options → Player**:

- the first check occurs about **10 seconds after startup**;
- a long-running MJMP session rechecks about **every 6 hours**;
- network work is asynchronous and does not block playback or the UI;
- the same available release is notified only once per process session;
- MJMP opens the corresponding GitHub release page;
- MJMP does **not** automatically download or execute updates.

The option can be disabled at any time.

---

## Public versioning

MJMP public versions use progressively extended numeric components:

```text
1
1.1
1.1.1
1.1.1.1
1.1.1.2
```

GitHub release tags use the corresponding `v` prefix:

```text
v1
v1.1
v1.1.1
v1.1.1.1
v1.1.1.2
```

---

## System requirements

- **64-bit Windows 10 or Windows 11**
- Working Windows audio stack
- **D3D11-capable GPU and driver** for the default renderer
- **D3D12-capable GPU and driver** when selecting the D3D12 renderer

Hardware acceleration availability varies by codec, GPU and driver.

---

## Repository scope

This repository is the **public binary-release repository** for MJMP.

It contains:

- release documentation;
- screenshots;
- release notes;
- integrity information;
- public project metadata.

The application executable is distributed through **GitHub Releases** rather than committed to the repository tree.

Private source code, internal build trees and development assets are not published here.

---

## Security

For vulnerability reporting and security information, see [SECURITY.md](SECURITY.md).

---

## License

See [LICENSE.txt](LICENSE.txt).

---

<p align="center">
  <strong>MJMP</strong><br>
  Portable Windows multimedia playback.
</p>
