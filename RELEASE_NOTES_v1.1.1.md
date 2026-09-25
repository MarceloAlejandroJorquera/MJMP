# MJMP v1.1.1

MJMP v1.1.1 is the current portable x64 Windows release, focused on **renderer/UI ownership parity, deterministic rapid scrubbing, and smooth display-cadence playback progress**.

## Highlights

- **WebM/VP9 compatibility:** hardware D3D11VA/D3D12VA remains first, but failed first-surface/bootstrap admission now falls back cleanly to direct **libvpx 1.17.0** with backward random-access re-entry so VP9 reference state is rebuilt correctly.
- **D3D11 software compatibility parity:** both `CpuYuv` and `CpuBgra` software production frames establish the software UI owner, fixing VP9/WebM renderer-switch ribbon/time/hover/hotkey/fullscreen liveness.
- **Single D3D11 application-UI path** for both production renderer selections.
- **D3D12 is production-video-only**; it no longer owns a separate playback-bar, seek-Chrome, UI queue, cadence, or scrub-preview implementation.
- **D3D12 Unbounded is truly unbound at the producer/presentation-policy level**: monitor refresh is observed but is not used as an FPS cap; the producer stays nonblocking/free-running and the freshest completed frame is used at each physical scanout opportunity.
- Native-D3D12 Unbounded throughput was further reduced by internal backend serialization, flip-phase-aligned cached interpolation slots, batched fence retirement and **Present-only repeats** for already-synthesized visible phases.
- Rapid **release → immediate re-grab → scrub** now follows one shared D11 interaction owner under both D3D11 and D3D12 video.
- Held BGRA/YUV scrub preview uses the **same native D3D11 preview compositor** for both production renderers.
- Removed the former **200 ms (~5 Hz) retained playback-bar clock**. Playback progress now refreshes at the measured DWM/display cadence using the existing high-resolution timer path.
- Timeline seek timestamps follow the media-duration format; remaining-time mode now colors only the semantic `-` marker red.
- Options/hover/diagnostics/fullscreen servicing was decoupled further from production video so UI activity does not collapse D3D12 Unbounded throughput.
- Corrected FFmpeg **A2/A3 relocation/provenance** for the v1.1.1 tree without changing the sealed A2 SDK bytes/hashes.
- Windows VERSIONINFO is normalized to **FileVersion 1.1.1.322 / ProductVersion 1.1.1**.
- Portable dependency validation passes with no dynamic FFmpeg/codec/MSVC runtime DLL requirement.

## Media stack

- FFmpeg **9.0.1** A2/A3 production base
- VVdeC **3.3.0-dev** (`e2a596a6524b`)
- dav1d AV1 sidecar
- libvpx **1.17.0**
- libopus **1.6.1**
- mpg123 **1.33.7**
- libopenmpt **0.8.9**

## Release assets

- `MJMPv1.1.1.exe`
- `SHA256SUMS.txt`
- `MJMP-v1.1.1-windows-x64.zip`
- `RELEASE_MANIFEST_v1.1.1.json`
- `RELEASE_ASSET_SHA256.txt`

## Integrity

Final executable:

```text
MJMPv1.1.1.exe
SHA-256: 86ded6a8edc426f1e778f993d98a6187c9f4b16a5eb6936b5a709c618c1487db
Size: 27,631,616 bytes
```

Verify in PowerShell:

```powershell
Get-FileHash .\MJMPv1.1.1.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The values must match exactly.

## Distribution

MJMP remains a **portable single EXE** for Windows x64. No installer or external codec pack is required.

> Windows may display its normal reputation/security prompt for an unsigned executable. Download MJMP from this repository's Releases page and verify the published SHA-256 checksum when desired.
