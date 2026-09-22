# MJMP v1.1

MJMP v1.1 is the second public MJMP release and a major update over v1, focused on playback determinism, D3D11/D3D12 robustness, seeking/scrubbing, broader codec coverage, retained UI responsiveness, color consistency, and a cleaner portable release pipeline.

## Highlights

- Portable **Windows x64 single executable** with static MSVC CRT and static third-party media dependencies.
- Production media stack rebased to **FFmpeg 9.0.1** through the completed A1/A2/A3 milestones.
- Updated static media stack including **VVdeC 3.3.0-dev**, dav1d, **libvpx 1.17.0**, **libopus 1.6.1**, **mpg123 1.33.7**, and **libopenmpt 0.8.9**.
- Major D3D11/D3D12 work: D3D12 reference-only decode handling, explicit GPU YUV conversion, source-raster scrub previews, renderer recovery, and stronger renderer/color parity.
- Large seeking/scrubbing rewrite with progressive retained previews, exact-target handoff, stale-generation rejection, rapid re-grab stabilization, and improved audio/video resume ownership.
- Improved H.264/AVC, HEVC/H.265, AV1, VP9, VVC/H.266, YUV422P, AVI, MP3, Opus, and tracker/module handling.
- D3D12 seek Chrome stabilized across rapid release/re-grab, fullscreen hover, live timestamp/red-marker ownership, notification updates, and preview catch-up.
- D3D11 held-preview quality and color behavior aligned with production playback.
- Unified stream-level color handling for BT.601/709/2020, full/limited range, PQ, HLG, and deterministic fallback policy for untagged media.
- M315/M315d color certification covers eight reference cases under both D3D11 and D3D12.
- **M6.21.317 final UI fix:** the playback-head feather now remains visually identical when entering/leaving seek hover, removing the faded-edge snap across video/audio and both renderers.
- Plain audio/no-artwork playback has deterministic black media presentation and independent post-scrub progress/hover liveness.
- Diagnostics OSD, Options, Bindings, tray behavior, Playlist/History, Media Properties, subtitles, fullscreen/window transitions, title/ribbon servicing, and custom controls received extensive responsiveness fixes.
- Added asynchronous GitHub update checking without automatic download or execution.
- Release engineering uses warning-free application builds, dependency provenance checks, transactional milestone installers, checksum manifests, and exact-binary color certification.

## Final qualification

The final **M6.21.317** executable is re-qualified during release finalization. The publication script reruns M315 against the exact binary, verifies all eight color cases under D3D11 and D3D12, and only then seals the SHA-256 below.

```text
MJMPv1.1.exe
SHA-256: 68520f2fdca441125bdeaf3fac13e17d8bfa4bce11f56e6beee8a75287f2184c
```

## Release policy

v1.1 is frozen at the binary above once published. Any bugs, compatibility cases, regressions, or UI/runtime refinements discovered afterward move to a successor release such as v1.1.1 rather than silently replacing the published v1.1 executable.

See `CHANGELOG.md` for the complete v1 -> v1.1 engineering history.
