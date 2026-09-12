# MJMP Public Architecture Summary

This document describes the high-level architecture exposed by the public MJMP v1 binary release. It does not contain private source code.

## Application

- Native 64-bit Windows application
- C++23
- MSVC 19.51 toolchain
- CMake 4.4.2
- Ninja 1.13.2
- Static MSVC runtime

## Media stack

- FFmpeg 9.0.1 static media stack
- dav1d AV1 decoder sidecar
- VVdeC VVC / H.266 decoding path
- libopenmpt tracker/module support

## Video

MJMP provides two selectable presentation paths:

- D3D11 — compatibility/default renderer
- D3D12 — optional renderer

The player exposes real output-allocation modes for 8-bit UNORM, 10-bit RGB and 16-bit-float scRGB where the selected renderer and system capabilities support them.

## Audio

Audio output uses Windows WASAPI.

## Subtitles

The player includes embedded/sidecar subtitle infrastructure and configurable subtitle presentation.

## Distribution

The public release is packaged as:

```text
MJMPv1.exe
SHA256SUMS.txt
```

The application binary is distributed as a portable single executable through GitHub Releases. The normal Git repository contains documentation and screenshots, not the executable itself.
