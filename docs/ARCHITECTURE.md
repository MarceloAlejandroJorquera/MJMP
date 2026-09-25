# MJMP Public Architecture — v1.1.1

## Distribution

MJMP v1.1.1 is a portable Windows x64 multimedia player distributed as `MJMPv1.1.1.exe`.

The intended release build statically links the MSVC runtime and third-party media stack. Release dependency inspection must not show dynamic FFmpeg/codec/MSVC runtime DLLs.

## Rendering ownership

### Application UI

**Native D3D11 is the single application-UI and interaction compositor.**

This includes:

- title bar;
- bottom ribbon;
- playback/seek lane;
- transport and volume controls;
- seek timestamp/interaction feedback;
- held scrub preview;
- retained player UI clock publication.

This ownership does not change when D3D12 is selected for production video.

### D3D11 production video

D3D11 remains the default production renderer and broad-compatibility path.

### D3D12 production video

D3D12 is an optional production-video renderer. In v1.1.1 it does **not** own a parallel application-UI, playback-bar, seek-Chrome, UI queue, UI cadence, or scrub-preview subsystem.

## Playback-progress clock

The presenter keeps a retained playback position anchored to a steady-clock/QPC timestamp and playback rate. The application UI extrapolates the visible playback position from that anchor.

v1.1.1 removes the older coarse 200 ms hardware UI repaint cadence. The compact playback-progress repaint is requested at the measured physical DWM/display refresh period. The existing high-resolution waitable timer is used for the next-deadline wait.

## Interactive seeking

Rapid seek/re-grab uses a single physical interaction owner.

For both D3D11 and D3D12 production video:

1. pointer movement owns the live seek target;
2. the D3D11 UI path owns the playback bar and seek feedback;
3. held scrub preview is presented by the shared D3D11 preview compositor;
4. release hands the selected target back to production playback.

D3D12 video work is isolated from application-UI liveness so the D11 UI does not block on the D3D12 backend API mutex during ordinary interaction.

## Media stack

The v1.1.1 release uses:

- FFmpeg 9.0.1 A2/A3 production base;
- VVdeC 3.3.0-dev (`e2a596a6524b`);
- dav1d;
- libvpx 1.17.0;
- libopus 1.6.1;
- mpg123 1.33.7;
- libopenmpt 0.8.9;
- WASAPI audio output.

## Output precision

MJMP exposes:

- 8-bit UNORM;
- 10-bit RGB;
- 16-bit-float scRGB.

Actual display output depends on source media, Windows composition, GPU/driver capability and display configuration.

## Color contract

The renderer paths retain a stream-level color contract covering matrix/range resolution and the associated D3D11/D3D12 production conversion paths introduced during v1.1 development.

## Release identity

```text
Public version:   1.1.1
GitHub tag:       v1.1.1
Build milestone:  M6.21.322
FileVersion:      1.1.1.322
ProductVersion:   1.1.1
Executable:       MJMPv1.1.1.exe
SHA-256:          86ded6a8edc426f1e778f993d98a6187c9f4b16a5eb6936b5a709c618c1487db
```
