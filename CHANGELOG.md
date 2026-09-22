# MJMP Changelog

## v1.1 — final release

MJMP v1.1 consolidates the successfully completed work since the public **v1 / M6.21.205** baseline. It is a major playback, renderer, seeking, codec, UI and release-engineering update rather than a small point revision.

The final v1.1 release binary is the **M6.21.317** `MJMPv1.1.exe`. Its SHA-256 is sealed during the final publication pass after M315 is rerun against that exact executable:

```text
SHA-256: 68520f2fdca441125bdeaf3fac13e17d8bfa4bce11f56e6beee8a75287f2184c
```

### Playback, decode and renderer architecture

- Reworked the playback pipeline around stronger separation between decode, presentation, interactive seek/preview work, audio cadence and retained UI/Chrome publication.
- Preserved **D3D11 as the first-run/default renderer** while substantially expanding the native D3D12 path.
- Hardened native D3D12 decode/presentation ownership, renderer recovery and reference-picture handling, including the validated **D3D12 Tier-1 reference-only map-v12** contract.
- Restored the H.264 three-byte Annex-B slice-prefix behavior required by the retained Tier-1 D3D12VA integration.
- Kept unreliable native H.264 D3D12 decoding fail-closed and routed H.264 through validated software/native-upload or compatibility paths rather than accepting corrupted native output.
- Added and refined direct/static software decode paths for formats that are unavailable or unsuitable for hardware decode on the target GPU.
- Added D3D11 split-plane GPU presentation for software-decoded planar YUV instead of forcing CPU RGB conversion.
- Added GPU-native planar handling for **YUV422P compatibility**, including the retained multi-slot upload path used to reduce stalls and drops.
- Added bounded software-rescue / cadence-control paths for demanding AV1 and VVC/H.266 material.
- Improved software-decoded AVI/high-rate AV1 presentation, retained-picture ownership and renderer handoff behavior.
- Improved renderer-transition, recovery and presentation-state handling so D3D11/D3D12 changes do not unnecessarily destroy playback state.
- Improved audio/video startup scheduling for software-heavy codecs and reduced cases where playback opened visibly paused, silent or starved.
- Added queue-aware yielding and bounded audio runway behavior so expensive software decode is less likely to starve audio or UI publication.

### Codec and media-stack upgrades

- Rebased the production FFmpeg integration to **FFmpeg 9.0.1**.
- Completed the FFmpeg **A1 exact-overlay capture**, preserving the historical patched behavior while leaving the golden Tier-1 SDK untouched.
- Completed the **A2 semantic replay / MSVC portability rebase**, including source-level MSVC corrections, a warning-free native rebuild, isolated shadow archives and semantic linker-symbol parity validation.
- Completed **A3 production-link cutover**, linking the application against the validated A2 shadow FFmpeg archives while retaining the previous Tier-1 SDK as read-only rollback/reference.
- Upgraded **VVdeC to pinned 3.3.0-dev** and synchronized the FFmpeg `libvvdec` ABI integration.
- Added/validated a direct static **dav1d** AV1 sidecar and AV1 software-decoding route.
- Added/validated **libvpx 1.17.0** for direct VP9/high-bit-depth software decode.
- Added/validated **libopus 1.6.1** for direct Opus software decode.
- Added/validated **mpg123 1.33.7** for direct MPEG Layer II/III / MP3 decode.
- Upgraded and validated **libopenmpt 0.8.9** for tracker/module playback.
- Retained FFmpeg as the main demuxing, hardware-decode and compatibility core while using the specialized static libraries where they provide a better direct path.
- Expanded practical playback coverage for H.264/AVC, HEVC/H.265, AV1, VP9, VVC/H.266, YUV422P, AVI, MP3, Opus and tracker/module files.
- Improved embedded artwork handling and preserved embedded/sidecar subtitle support across the updated media pipeline.

### Seeking, scrubbing and resume behavior

- Reworked interactive seeking into a **nonblocking retained-preview pipeline** instead of tying mouse interaction directly to the production decode loop.
- Added progressive scrub-preview generation and newest-target arbitration so stale preview work is rejected rather than displayed late.
- Added exact target-generation fencing so an older seek transaction cannot overwrite a newer physical drag/re-grab.
- Added bounded exact-preroll / exact-resume handling and hardened mouse-up behavior against stale generations, decoder drain, EOF, renderer recovery and fast repeated gestures.
- Preserved the selected timestamp through seek handoff instead of allowing parser/demux state to silently shift the requested position.
- Added codec-level random-access-point discovery and demuxer-safe timestamp handoff for difficult AV1 sources.
- For single-RAP AV1/AVI material, added **warmed dav1d DPB promotion/loan** so decoder state built during scrubbing can be transferred to production playback instead of always reconstructing the same dependency chain twice.
- Preserved warmed reference state across successful promotion and added packet-resume barriers so already represented compressed data is not resubmitted incorrectly.
- Improved forward-scrub continuity while retaining safe rebuild behavior for backward movement when codec reference state cannot be rewound.
- Added production-video + target-era PCM fencing for difficult AVI/AV1 seek/resume cases.
- Removed preview-state ownership from audio decode and strengthened the separation between visual scrub state and production audio state.
- Improved scrub behavior at EOF and during rapid release/re-grab sequences.
- Kept the playback bar, floating timestamp, seek notification and held preview synchronized to the current gesture instead of the previous release position.
- Made the bottom-right ribbon time continue updating during held scrubbing and other mouse-hold interaction loops.
- Preserved the intended pre-scrub Play/Pause state through exact-seek landing so temporary seek pause state does not flash the wrong transport glyph.

### D3D12 seek/hover/notification stabilization

- Reworked native-D3D12 seek feedback around an atomic layered USER32 owner using `UpdateLayeredWindow`.
- Added generation-fenced rapid re-grab handling so a new physical press immediately supersedes an older retained seek state.
- Added destructive cleanup of stale seek/peek pixels when required, preventing previous-position timestamp/red-marker remnants from surviving a logical no-op.
- Restored fullscreen passive-hover visibility for the floating timestamp badge and red seek marker.
- Unified D3D12 hover, held scrub and release handoff under a **continuous full seek-lane owner**, eliminating the old owner topology change at release/re-click boundaries.
- Added explicit double-click/re-click handling for rapid second presses delivered inside the Windows double-click interval.
- Decoupled the D3D12 side seek notification from retained-presenter cadence so it continues updating while the live seek lane is owned independently.
- Corrected D3D12 preview arbitration so cleanup epochs cannot starve newer scrub-preview frames.
- Removed the diagnostics/seek-transient ownership collision that caused the seek notification to disappear and reappear at the diagnostics polling cadence.
- Reduced unnecessary pointer-rate z-order churn while preserving the required first-show/fullscreen z-order repair.
- Preserved D3D11 behavior while the D3D12-specific interaction path was stabilized.

### D3D11 scrub-preview and renderer color parity

- Raised D3D11 hardware scrub previews from the older low-resolution proxy path to **source-raster preview quality** for supported hardware-decoded material.
- Replaced the old fast proxy conversion with higher-quality chroma reconstruction while bounding the source-raster preview cache.
- Kept software/fallback preview routes bounded where full-raster conversion cost is not justified.
- Removed the failed private NV12/P010 VideoProcessor scrub carrier and replaced it with MJMP's deterministic split-plane GPU YUV path, eliminating the green-curtain failure while retaining source-raster sharpness.
- Used normative private-preview decode settings instead of deliberately reduced reconstruction quality.
- Propagated decoded color information into D3D11 instead of hard-coding every hardware frame as BT.709 studio-range.
- Added 601/709/2020 and full/studio mapping for D3D11 production/scrub paths.
- Reworked ordinary D3D11 NV12/P010 production conversion so YUV->RGB uses MJMP's explicit shader math rather than delegating color conversion to the driver VideoProcessor.
- Bypassed driver VideoProcessor FRC for the ordinary explicit-YUV path; temporal interpolation occurs only after frames pass through MJMP's controlled color conversion.
- Unified D3D11 playback, D3D11 held preview, D3D12 and software paths under the same stream-level matrix/range policy.
- Removed the systematic D3D11 held-preview/resumed-playback tint discontinuity caused by using different conversion engines.

### Unified color contract and certification

- Added a single authoritative **stream-level color contract** covering matrix, range, primaries, transfer and chroma-location metadata.
- Added deterministic fallback policy for untagged media: BT.2020 where indicated by BT.2020/PQ/HLG descriptors, BT.601 for SD geometry, otherwise BT.709; range defaults to studio unless explicitly full/YUVJ.
- Kept the final renderer color contract immutable for the stream rather than allowing frame-to-frame metadata drift.
- Adjusted the freeze point for FFmpeg 9.x so fields omitted from `AVStream::codecpar` may be promoted once from the **first successfully decoded frame**, after which the contract is permanently frozen.
- Added machine-readable `[MJMP][COLOR-CONTRACT]` runtime attestations containing declared/resolved metadata and fallback state.
- Added `[MJMP][COLOR-PATH]` attestations from the actual D3D11/D3D12 playback and snapshot routes.
- Added an independent source-parity test for D3D11/D3D12 BT.601/709/2020 coefficients and limited/full-range normalization.
- Added an independent reference transform test covering neutral black/white endpoints for full/studio 8-bit and P010 stored-code 10-bit paths.
- Added a deterministic 8-case color corpus covering BT.601, BT.709 limited/full, BT.2020 SDR, PQ, HLG and intentionally untagged SD/HD fallback cases.
- Repaired the H.264 qualification corpus to use hardware-compatible deterministic Constrained Baseline vectors instead of lossless High 4:4:4 Predictive streams.
- Added robust ffprobe-based encoded-metadata verification and one-frame metadata recovery when stream-level FFmpeg metadata is unspecified.
- Added JSON/TSV qualification reports and retained per-case/per-renderer runtime logs on failure.
- Added `-RequireColorQualified` release verification that binds a PASS report to the exact current executable SHA-256.
- Completed the final D3D11 + D3D12 color qualification with **all 8 cases PASS**.
- Sealed the successful qualification to the final v1.1 binary SHA-256:
  `68520f2fdca441125bdeaf3fac13e17d8bfa4bce11f56e6beee8a75287f2184c`.

### Audio-only playback and audio behavior

- Added direct mpg123 playback for MP3/MP2 and direct libopus handling for Opus where applicable.
- Decoupled no-video/audio-only UI cadence from video Present cadence.
- Fixed plain-MP3 post-scrub liveness so the playback head, time display and hover controls do not require additional pointer movement to resume updating.
- Kept the no-video Chrome clock alive through scrub transactions and nonblocking UI-state contention.
- Separated true no-video playback from artwork-backed audio presentation.
- Plain audio with no artwork now owns a deterministic **black loaded-media surface**; the gray MJMP-logo surface is reserved for idle/no-media state.
- Improved audio queue/runway behavior for software AV1/VVC/VP9 workloads to reduce crackle/starvation during expensive decode.
- Improved audio/video resume ownership around exact seeks and difficult AVI/AV1 handoffs.

### Diagnostics and performance UI

- Expanded the diagnostics OSD into independent **LATENCIES** and **FRAMERATE** graphs.
- Added retained graph sampling/statistics designed not to reset simply because the OSD is hidden/revealed.
- Improved graph formatting, grid/range presentation and MIN/AVG/MAX reporting.
- Kept diagnostics publication independent from ordinary player UI transactions.
- Improved graph/ribbon/title servicing during window drag, move/resize, menus and other native input loops.
- Reduced cases where holding the mouse button inside the player froze ribbon/diagnostic updates.
- Improved z-order/layering so diagnostics remain below higher-priority options/list UI while seek/notification transients can remain visible when required.

### Options, controls and visibility

- Substantially reworked the custom Options surface for more deterministic geometry, scrolling, clipping and focus behavior.
- Added/retained distinct **Behavior** and **Visibility** sections where interaction policy and interface visibility are configured separately.
- Added persisted maximum-visibility behavior and separate title-bar/bottom-ribbon visibility controls.
- Added/retained keyboard control for ribbon-only and maximum-visibility modes.
- Improved category switching, scrolling, nested/cascade geometry, selection contours and custom scrollbar behavior.
- Reduced Options open/close and page-switch flicker by keeping custom UI publication atomic and avoiding unnecessary native-control churn.
- Refined the Video page layout, renderer/output selectors and bit-depth controls.
- Improved custom font/selector cascades, caret placement, joined borders and bottom-rail geometry.
- Improved hand cursors and other direct interaction feedback on clickable custom controls.

### Subtitle UI

- Retained the GDI+ subtitle rendering path.
- Expanded subtitle configuration with actual font preview, size control, Bold/Italic/Underline, foreground color, background color and alpha/transparency controls.
- Added numeric/manual value entry where appropriate and clamped values to supported ranges.
- Improved subtitle font rows by using rendered glyph bounds instead of simplistic text metrics.
- Improved subtitle-option hierarchy/layout and removed redundant preview-layer/UI artifacts.
- Added external **Load subtitle file** support.
- Kept subtitle scrub/preview interaction UI-local until release so subtitle-control manipulation does not unnecessarily disturb playback.

### Playlist, History and Media Properties

- Improved Playlist and History retained panels, including capitalized headings, compact count presentation and stronger active-item treatment.
- Added regex-capable search UI with selectable/editable search text.
- Added/remained support for filename marquee/manual horizontal drag behavior for long rows.
- Preserved explicit Playlist insertion semantics: ordinary file open, hotkey open and main-player drops do not automatically become Playlist additions; direct drops into Playlist remain the explicit add operation.
- Improved History metadata presentation, including stored date/time context.
- Improved row scrolling/viewport behavior and reduced resize/fullscreen panel flicker.
- Added/refined the Media Properties window with General/Video/Audio sections, collapsible grouping, a bounded row viewport, truncation/fade/manual horizontal navigation and selectable/copyable values.
- Media Properties closes when it loses focus, keeping it lightweight rather than permanently occupying the player UI.

### Bindings / file associations

- Reworked the internal Bindings page and extension table.
- Improved effective/protected association-state presentation, including problematic extensions such as `.ts` / `.mts`.
- Reduced unnecessary shell-wide icon-refresh churn caused by association interaction.
- Improved checkbox/toggle responsiveness and viewport-fitted extension layout.
- Packed the supported extension set into adaptive columns rather than requiring unnecessary outer scrolling.
- Kept association controls inside MJMP rather than depending on a separate installer UI.

### Tray, fullscreen, window state and startup

- Expanded and stabilized the custom tray preview with playback controls and pin/unpin behavior.
- Separated tray-command authorization from normal playback hotkeys so stale tray hover state cannot accidentally consume Playlist/History/pin shortcuts.
- Improved tray -> fullscreen, fullscreen -> tray and tray -> windowed/maximized presenter ownership recovery.
- Fixed duplicate tray "Open files" dispatch behavior.
- Improved opening media from tray without unnecessarily restoring the main window.
- Improved startup/tray ownership and hidden-instance handoff behavior.
- Added direct tray-start playback behavior while keeping the primary HWND intentionally hidden when configured.
- Improved fullscreen transition covers, notification layering and restoration order to reduce gray/black/windowed flashes.
- Improved native window dragging and retained-compositor behavior during move/resize.
- Improved maximize/restore, fit-to-media and snap/assigned-window geometry handling.
- Improved title/ribbon servicing while dragging/resizing so playback state is less coupled to the native modal move loop.

### Title bar, ribbon and player Chrome

- Continued the custom retained title-bar and bottom-ribbon design introduced before v1 and substantially hardened its runtime ownership in v1.1.
- Improved title/ribbon contour geometry, resizing behavior and custom hit regions.
- Added/retained compact time / remaining-time / volume presentation.
- Added floating seek-time feedback above the playback lane.
- Refined the seek lane with stronger hover/active feedback, red pointer marker and improved elapsed/progress visibility.
- **M6.21.317:** unified the normal retained playback head and the hover-owned seek lane under the same 32-column feather contract, eliminating the visible faded-edge snap/glitch when the pointer enters or leaves the playback bar across video/audio and D3D11/D3D12.
- Kept held-seek timestamp, playback bar and ribbon time synchronized during active interaction.
- Improved empty-player presentation and open/drop guidance.
- Improved notification layering so player messages do not unnecessarily interfere with playback or diagnostics.

### Hotkeys and input ownership

- Retained dedicated Playlist/History hotkeys and hardened their dispatch.
- Separated tray-only commands from normal player hotkey handling; tray pin/unpin and list commands require fresh tray/preview ownership rather than cached geometry.
- Reduced hotkey/input conflicts between visibility behavior, regular playback controls and text/search fields.
- Improved held-input servicing so UI clocks and playback state do not stall simply because Windows is inside mouse/menu tracking.

### Update checking

- Added a persisted **Check new versions** option.
- Added asynchronous GitHub release checking after startup and periodic rechecks during long sessions.
- Update checks do not block playback or the main UI.
- A release notification opens the configured GitHub release page.
- MJMP does **not** automatically download or execute updates.
- Repeated notification for the same available release is suppressed within the process session.

### Build, portability and dependency engineering

- Kept MJMP as a **Windows x64 Release-only portable single executable**.
- Kept the MSVC CRT and third-party media dependencies statically linked; portable dependency inspection expects only Windows system DLLs.
- Standardized the normal developer workflow around `run.bat`: clean application rebuild, dependency validation, publish and launch.
- Preserved expensive validated dependency SDKs across ordinary clean builds rather than rebuilding them every time.
- Added explicit dependency/source provenance markers and SHA-256 validation.
- Added strict warning-free application build enforcement and fixed source warnings rather than suppressing them.
- Added stronger source/build contract checks so stale patched SDK/source combinations fail closed.
- Added rollback snapshots and fail-closed transactional installers for milestone changes.
- Added more deterministic handling of locked/stale running MJMP processes before replacing the release executable.
- Added checksum manifests for published binaries.
- Added explicit version/resource normalization for **v1.1**.
- Improved build-console diagnostics while keeping the persistent static dependency model visible and auditable.

### Release engineering and repository cleanup

- Added durable build/rebase/qualification documentation for the v1.1 media stack.
- Added `RELEASE_NOTES_v1.1.md`, `RELEASE_CHECKLIST_v1.1.md`, release-readiness documentation and GitHub release staging support.
- Added automated release-tree verification with optional exact-binary and color-qualification gates.
- Separated routine runtime/source verification from GitHub-facing release-document checks.
- Added the A4 codec/container/audio × renderer runtime-qualification framework and machine-readable evidence plumbing for continued engineering qualification.
- Added the M315 color certification gate as the final renderer/color qualification used for the frozen v1.1 binary.
- Removed obsolete one-shot patch/rollback/capture/probe artifacts from the intended release tree while retaining durable dependency/rebase/qualification tooling.
- Removed unreferenced build/probe artifacts and unused source artwork that was no longer consumed by the executable.
- Reduced the private release tree from the earlier development-heavy state while keeping the validated persistent SDK and current release tooling.
- Updated the public-version convention and GitHub release plumbing for `v1.1` and future progressively extended versions (`v1.1.1`, etc.).
- Prepared the final v1.1 binary-release workflow around the exact M6.21.317 executable after the final seek-feather fix and renewed M315 certification; later fixes are intended for successor versions rather than silently replacing the published v1.1 binary.

### Qualification / release status

- **A1:** completed — exact FFmpeg 9.0.1 overlay capture.
- **A2:** completed — semantic replay, MSVC portability cleanup, warning-free rebuild and linker-symbol parity validation.
- **A3:** completed — production application linked against the validated A2 shadow SDK.
- **A4:** framework retained for engineering/runtime coverage; not used as a blocker for the simplified final v1.1 publication policy.
- **M315/M315d color qualification:** completed; rerun and sealed to the final M6.21.317 executable during publication.
- Final color corpus result: **8/8 cases PASS under D3D11 and D3D12**.
- Final release-tree verifier result: **PASS**.
- Frozen v1.1 executable SHA-256:
  `68520f2fdca441125bdeaf3fac13e17d8bfa4bce11f56e6beee8a75287f2184c`.

## v1

Initial public release.
