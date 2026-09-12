# MJMP

**Portable x64 Windows multimedia player with broad codec support and GPU-accelerated playback.**

MJMP is distributed as a **single executable**. No codec pack, FFmpeg installation, Visual C++ Redistributable, OpenMPT installation, dav1d installation, or VVdeC installation is required.

## Download

Download **`MJMPv1.exe`** from the [latest GitHub release](https://github.com/MarceloAlejandroJorquera/MJMP/releases/latest).

## Screenshots

### Player

![MJMP main player with context menu](docs/screenshots/01-player/01-main-player-context-menu.png)

![MJMP tray playback preview](docs/screenshots/01-player/02-tray-preview.png)

### Options

#### Player

![MJMP Player options](docs/screenshots/02-options/01-player.png)

#### Playback

![MJMP Playback options](docs/screenshots/02-options/02-playback.png)

#### Video

![MJMP Video options](docs/screenshots/02-options/03-video.png)

#### Subtitles

![MJMP Subtitle options](docs/screenshots/02-options/04-subtitles.png)

#### Hotkeys

![MJMP Hotkey options](docs/screenshots/02-options/05-hotkeys.png)

## Features

- Portable **single-file x64 Windows executable**
- Static media codec/demux stack
- D3D11 compatibility renderer selected by default on a fresh configuration
- Optional D3D12 renderer
- Selectable 8-bit, 10-bit, and 16-bit-float output precision
- Configurable source-FPS presentation behavior
- Subtitle styling and preview controls
- Tray playback preview and transport controls
- Playlist/history, hotkeys, and visibility controls
- Built-in GitHub update notification support

## Requirements

- 64-bit Windows 10 or Windows 11
- A working Windows audio stack
- A D3D11-capable GPU/driver for the compatibility renderer
- D3D12-capable hardware/driver when selecting the D3D12 renderer

## Updates

MJMP checks this repository for a newer stable release when **Check new versions** is enabled under **Options → Player**.

The policy is intentionally low-frequency:

- first check approximately **10 seconds after startup**;
- while MJMP remains open, recheck approximately **every 6 hours**;
- requests are asynchronous and do not block playback or the UI;
- the same available release is notified only once per application session;
- MJMP does **not** automatically download or execute updates.

## Versioning

Public versions use progressively extended numeric components:

- `1`
- `1.1`
- `1.1.1`
- `1.1.1.1`
- `1.1.1.2`

GitHub release tags use the corresponding `v` prefix, for example `v1`, `v1.1`, or `v1.1.1.1`.

## Integrity

Release assets may include:

- `MJMPv1.exe`
- `SHA256SUMS.txt`

Verify the executable with PowerShell:

```powershell
Get-FileHash .\MJMPv1.exe -Algorithm SHA256
```

Compare the result with the value published in `SHA256SUMS.txt` for the same release.

## Repository scope

This repository contains **binary release documentation and screenshots**. The executable itself is distributed through GitHub Releases rather than committed to the repository tree. Source code and private build/dependency trees are not included.
