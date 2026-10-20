# MJMP

**A high-performance, portable Windows x64 multimedia player.**

MJMP combines native Windows presentation, responsive playback controls, and a statically linked media stack in a single executable. It uses D3D11 for the application interface and offers D3D11 or D3D12 for production video, subject to hardware and driver support.

## Latest release — v1.1.1.2

**[Download MJMP from GitHub Releases](https://github.com/MarceloAlejandroJorquera/MJMP/releases)**

The v1.1.1.2 release provides:

- A **portable x64 executable**, without an installer or external codec pack.
- A single **D3D11-owned interface** across video renderer choices, including playback controls and seek preview.
- Optional **D3D12 production-video presentation** on supported systems.
- Improved playback progress and seek/re-scrub behavior inherited from the v1.1.1 series.
- Updated statically linked media components: FFmpeg 9.0.1 A2/A3, VVdeC 3.3.0-dev, dav1d, libvpx 1.17.0, libopus 1.6.1, mpg123 1.33.7, and libopenmpt 0.8.9.
- **Bindings for 72 of 76 listed media extensions**, including `.dsf` and `.dff`. Four ambiguous/unsupported extensions—`.ofr`, `.ofs`, `.raw`, and `.pcm`—remain unavailable for automatic association.

**Note:** A selectable extension is not a guarantee of full runtime qualification for every codec variant or container. DSF playback has been observed; DFF/DST and complete D3D11/D3D12 runtime qualification are tracked separately.

See the [v1.1.1.2 changelog](release/MJMP_RELEASE_NOTES_v1.1.1.2.md) for release-specific details.

## Download and verify

Download the files for the selected version from **Releases**:

- `MJMPv1.1.1.2.exe` — portable Windows x64 application.
- `MJMPv1.1.1.2.zip` — binary distribution containing the executable and public release notes.
- `SHA256SUMS.txt` — published SHA-256 checksums.

In Windows PowerShell, verify the executable after downloading it:

```powershell
Get-FileHash .\MJMPv1.1.1.2.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

Compare the hash exactly with the checksum manifest from the *same* GitHub release.

## System requirements

- Windows 10 or Windows 11, **64-bit**.
- D3D11-capable GPU and driver.
- D3D12-capable GPU and driver when selecting D3D12 production video.
- Working Windows audio output.

Hardware acceleration depends on the GPU, driver, codec, profile, and stream. CPU-specific SIMD features use runtime dispatch where supported; AVX2 is not a blanket system requirement.

## Player architecture

The application interface (title bar, transport controls, playback ribbon, and seek interaction) uses a native D3D11 path. D3D12, when selected, is responsible for production video—not the interaction UI. The player keeps the retained progress clock and seek-preview architecture from the v1.1.1 line.

## Distribution and support

This public repository is for **binary releases and user-facing documentation**. It does not distribute MJMP's private application source code, local build tools, dependency SDKs, or build caches.

For previous versions, changelogs, and downloadable artifacts, use the [Releases page](https://github.com/MarceloAlejandroJorquera/MJMP/releases). For bugs and compatibility reports, use [Issues](https://github.com/MarceloAlejandroJorquera/MJMP/issues) if enabled for the repository.
