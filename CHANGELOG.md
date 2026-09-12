# Changelog

## v1

### Distribution

- First public MJMP binary release for 64-bit Windows.
- Portable single-executable distribution: `MJMPv1.exe`.
- Static media/dependency stack; no separate codec pack or Visual C++ Redistributable installation is required.
- Release integrity manifest published as `SHA256SUMS.txt`.

### Player and playback

- Custom player interface, context menu and transport ribbon.
- Playlist, history, seeking, frame/file navigation and configurable hotkeys.
- Tray playback preview with transport controls, fullscreen expansion and pinning.
- Configurable playback-progress persistence and end-of-file behavior.

### Video

- D3D11 compatibility renderer selected by default on a fresh configuration.
- Optional D3D12 renderer.
- Selectable 8-bit UNORM, 10-bit RGB and 16-bit-float scRGB output precision.
- Configurable source-FPS presentation behavior.

### Subtitles

- Embedded and sidecar subtitle workflows.
- Configurable font, size, style, foreground/background color and alpha.
- Live subtitle-style preview.

### Updates

- Optional GitHub release checking under **Options → Player → Check new versions**.
- Deferred startup check and low-frequency periodic checks during long-running sessions.
- Update notification links to the GitHub release page; MJMP does not auto-install releases.
