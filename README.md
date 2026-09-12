<h1 align="center">MJMP</h1>

<p align="center">
  <strong>High-performance portable x64 Windows multimedia player with broad codec support and GPU-accelerated playback.</strong>
</p>

<p align="center">
  <img alt="Release v1" src="https://img.shields.io/badge/release-v1-2ea043">
  <img alt="Status Stable" src="https://img.shields.io/badge/status-stable-2ea043">
  <img alt="Platform Windows x64" src="https://img.shields.io/badge/platform-Windows%20x64-0078D4">
  <img alt="Language C++23" src="https://img.shields.io/badge/language-C%2B%2B23-00599C">
  <img alt="Compiler MSVC 19.51" src="https://img.shields.io/badge/compiler-MSVC%2019.51-5C2D91">
</p>

<p align="center">
  <img alt="Renderer D3D11 Default" src="https://img.shields.io/badge/renderer-D3D11%20default-4B8BBE">
  <img alt="Renderer D3D12 Available" src="https://img.shields.io/badge/renderer-D3D12%20available-6f42c1">
  <img alt="FFmpeg 9.0.1" src="https://img.shields.io/badge/media-FFmpeg%209.0.1-7E2D2D">
  <img alt="AV1 dav1d" src="https://img.shields.io/badge/AV1-dav1d-00897B">
  <img alt="VVC / H.266 VVdeC" src="https://img.shields.io/badge/VVC%20%2F%20H.266-VVdeC-8E44AD">
  <img alt="Tracker modules libopenmpt" src="https://img.shields.io/badge/modules-libopenmpt-3A6EA5">
</p>

<p align="center">
  <img alt="Audio WASAPI" src="https://img.shields.io/badge/audio-WASAPI-0067B8">
  <img alt="Distribution Portable Single EXE" src="https://img.shields.io/badge/distribution-portable%20single%20EXE-444444">
  <img alt="Integrity SHA-256" src="https://img.shields.io/badge/integrity-SHA--256-CB6D17">
  <img alt="Update checks GitHub Releases" src="https://img.shields.io/badge/update%20checks-GitHub%20Releases-24292F">
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

<table align="center">
  <thead>
    <tr>
      <th>Area</th>
      <th>Highlights</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Distribution</strong></td>
      <td>Portable <code>MJMPv1.exe</code>; no installer; no external codec pack</td>
    </tr>
    <tr>
      <td><strong>Rendering</strong></td>
      <td>D3D11 compatibility path + optional D3D12 path</td>
    </tr>
    <tr>
      <td><strong>Output precision</strong></td>
      <td>8-bit UNORM, 10-bit RGB, 16-bit-float scRGB</td>
    </tr>
    <tr>
      <td><strong>Playback</strong></td>
      <td>Source-rate / unlocked presentation modes, seeking, frame/file controls</td>
    </tr>
    <tr>
      <td><strong>Audio</strong></td>
      <td>WASAPI output with bundled decoding and conversion paths</td>
    </tr>
    <tr>
      <td><strong>Subtitles</strong></td>
      <td>Embedded and sidecar subtitle support with configurable styling and preview</td>
    </tr>
    <tr>
      <td><strong>Tray</strong></td>
      <td>Live playback preview, transport controls, pinning and fullscreen expansion</td>
    </tr>
    <tr>
      <td><strong>Library workflow</strong></td>
      <td>Playlist, history, regex search, hotkeys and configurable interface visibility</td>
    </tr>
    <tr>
      <td><strong>Updates</strong></td>
      <td>Optional GitHub release checks from <strong>Options → Player → Check new versions</strong></td>
    </tr>
    <tr>
      <td><strong>Integrity</strong></td>
      <td>SHA-256 manifest published beside each release binary</td>
    </tr>
  </tbody>
</table>

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

> **Note:** Windows may display its normal reputation/security prompt for a newly published unsigned executable. Download MJMP only from this repository's **Releases** page and verify the published SHA-256 checksum when desired.

---

## Release integrity

Every release is intended to provide:

```text
MJMPv1.exe
SHA256SUMS.txt
