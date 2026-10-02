# MJMP Public Architecture — v1.1.1.1

## Distribution

MJMP v1.1.1.1 is a portable Windows x64 multimedia player. The release archive is `MJMPv1.1.1.1.zip`, containing the portable `MJMPv1.1.1.1.exe`, release notes and license.

The intended release build statically links the MSVC runtime and third-party media stack. Release dependency inspection must not show dynamic FFmpeg/codec/MSVC runtime DLLs.

## Rendering ownership

### Application UI

**Native D3D11 is the single application-UI and interaction compositor.**

This includes the title bar, bottom ribbon, playback/seek lane, transport and volume controls, seek feedback, held scrub preview, and retained player UI clock publication. This ownership does not change when D3D12 is selected for production video.

### D3D11 production video

D3D11 remains the default production renderer and broad-compatibility path.

### D3D12 production video

D3D12 remains an optional production-video renderer. It does **not** own a parallel application-UI, playback-bar, seek-Chrome, UI queue, UI cadence, or scrub-preview subsystem.

## Retained playback clock

The player UI retains an authoritative media-position sample together with a QPC/steady-clock anchor and playback rate. While playback is running, visible position is projected from that anchor and clamped to the known media duration where applicable.

v1.1.1.1 removes the former arbitrary one-minute projection lifetime. The retained clock therefore remains valid for uninterrupted playback instead of pinning current time, remaining time, and progress after the horizon expires.

The compact playback-progress path remains scheduled at the measured DWM/display cadence. The current/remaining-time badge uses the **same QPC-projected transport position** for its damage decision and only rerasterizes when the visible second changes. As a result, the timestamp advances independently of mouse hover while avoiding full-ribbon text work at display refresh rate.

## Interactive seeking and convergence

Rapid seek/re-grab continues to use a single physical interaction owner shared by D3D11 and D3D12 production-video selections.

After seek release, the retained visual state converges against the transport's authoritative seek epoch and landed position. A coalesced semantic refresh remains active during that convergence window, so current time, remaining time and progress do not depend on subsequent pointer movement, hover, pause/resume, or renderer-specific presentation evidence.

## Non-client resize interaction

A resize-border/corner press/release that produces no geometry change is treated as a strict no-op. The replacement resize-shell/compositor handoff is entered only for a real geometry change, preventing stationary border clicks from briefly exposing the fallback playback background.

## Media stack

The v1.1.1.1 hotfix keeps the v1.1.1 media stack unchanged:

- FFmpeg 9.0.1 A2/A3 production base;
- VVdeC 3.3.0-dev (`e2a596a6524b`);
- dav1d;
- libvpx 1.17.0;
- libopus 1.6.1;
- mpg123 1.33.7;
- libopenmpt 0.8.9;
- WASAPI audio output.

## Output precision

MJMP exposes 8-bit UNORM, 10-bit RGB, and 16-bit-float scRGB output modes. Actual display output depends on source media, Windows composition, GPU/driver capability and display configuration.

## Color contract

The renderer paths retain the stream-level color contract covering matrix/range resolution and the associated D3D11/D3D12 production conversion paths introduced during v1.1 development.

## Release identity

```text
Public version:   1.1.1.1
GitHub tag:       v1.1.1.1
Build milestone:  M6.21.322qfju
FileVersion:      1.1.1.1
ProductVersion:   1.1.1.1
Executable:       MJMPv1.1.1.1.exe
Release archive:  MJMPv1.1.1.1.zip
SHA-256:          see SHA256SUMS.txt attached to the v1.1.1.1 release
```
