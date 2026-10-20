# MJMP v1.1.1.2 — Windows x64

MJMP v1.1.1.2 is a portable, single-executable Windows x64 multimedia player. This version updates media-format integration, file-association availability, and the retained static playback stack.

## Changes since v1.1.1.1

- Updated static FFmpeg 9.0.1 A2/A3 integration, preserving the D3D12 Tier-1 reference-only mapping and descriptor-pinned H.264 path. The isolated A2 shadow archive compilation and the application Release build passed their warning-free gates.
- Synchronized VVdeC 3.3.0-dev (`c8cfd6c49672`) with the FFmpeg VVC/H.266 decoding integration.
- Pinned dav1d master (`1aed984b0bef34e1d3333a0b6f4c16c89994c1c1`), libvpx 1.17.0, libopus 1.6.1, mpg123 1.33.7, and libopenmpt 0.8.9; native Opus /MT compilation no longer passes GCC-only SSE flags to MSVC.
- DSD audio conversion path routes decoded DSD to PCM for Windows audio output. DSF playback has been observed on Windows; full DFF/DST runtime coverage remains a separate test.
- Bindings displays 76 extensions, with 72 selectable. `.dsf` and `.dff` are selectable for individual associations and Bind All. `.ofr`, `.ofs`, `.raw`, and `.pcm` remain unavailable, avoiding unsupported or ambiguous input associations.
- Preserves native D3D11 application controls and interaction-preview composition independently of D3D12 video presentation, retained-clock progress, and rapid re-scrub behavior.
- Refreshed the embedded file/product version and portable artifact name to **1.1.1.2**.

## Compatibility and limitations

Bindings availability is **not a guarantee that every container/codec combination works**. DFF (including DST), uncommon variants, GPU-specific acceleration, and the complete A4 runtime corpus require verification on the precise published binary. Hardware decoding depends on stream, driver, and GPU support.

The program is designed for 64-bit Windows 10/11 and a D3D11-capable GPU. D3D12 production video requires compatible hardware and drivers. No installer or separate codec pack is intended.

## Downloads

- `MJMPv1.1.1.2.exe` — portable executable
- `MJMPv1.1.1.2.zip` — executable and release notes
- `SHA256SUMS.txt` — matching executable and ZIP checksums
- `RELEASE_MANIFEST_v1.1.1.2.json` — build identity, file hash, and qualification state

Check downloaded file integrity in Windows PowerShell:

```powershell
Get-FileHash .\MJMPv1.1.1.2.exe -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The SHA-256 value must match the uploaded release checksum. A binary being built or launched successfully is not, by itself, evidence of full format- or renderer-runtime qualification.
