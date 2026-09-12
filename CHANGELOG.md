# Changelog

All notable public MJMP binary releases are documented here.

## v1

Initial public binary release for 64-bit Windows.

### Distribution

- Portable single-file application: `MJMPv1.exe`.
- No installer required.
- Static media/runtime dependency model.
- No external codec pack required.
- No separate Microsoft Visual C++ Redistributable installation required for the release build.
- SHA-256 release manifest workflow through `SHA256SUMS.txt`.

### Rendering

- D3D11 renderer selected by default on a fresh configuration.
- Optional D3D12 renderer.
- Real selectable output allocation modes:
  - 8-bit UNORM
  - 10-bit RGB
  - 16-bit-float scRGB
- Source-rate and unlocked presentation controls.

### Media

- FFmpeg 9.0.1 media stack.
- dav1d AV1 decoding path.
- VVdeC VVC / H.266 decoding path.
- libopenmpt tracker/module playback.
- Embedded artwork handling.
- Embedded and sidecar subtitle infrastructure.

### Audio

- Windows WASAPI output path.
- Bundled audio decode/conversion stack.

### Interface

- Custom player window and context menu.
- Tray playback preview and transport controls.
- Tray pinning and fullscreen expansion.
- Playlist and history workflows.
- Regex search support.
- Configurable interface visibility.
- Configurable subtitle presentation.
- Hotkey reference/configuration page.
- Diagnostics OSD.

### Updates

- GitHub release checks can be enabled/disabled under **Options → Player → Check new versions**.
- First automatic check occurs approximately 10 seconds after startup.
- Long-running sessions recheck approximately every 6 hours.
- Checks are asynchronous.
- The same available release is notified only once per process session.
- Updates are not automatically downloaded or executed.
