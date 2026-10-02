# MJMP v1.1.1.1

Critical hotfix release for MJMP v1.1.1.

### Fixed

- Current/remaining time and playback progress no longer freeze after prolonged playback.
- Seek-release time/progress state now resumes independently of pointer movement.
- Current/remaining badges no longer require hovering the playback bar, volume, or transport controls to refresh.
- Stationary clicks on resize borders/corners no longer flash the fallback playback background.

The renderer/media architecture is unchanged: D3D11 remains the single application-UI compositor and D3D12 remains production-video-only.

### Download

Download `MJMPv1.1.1.1.zip` and verify it against the attached `SHA256SUMS.txt` (or `MJMPv1.1.1.1.zip.sha256`) before extracting `MJMPv1.1.1.1.exe`.

See `RELEASE_NOTES_v1.1.1.1.md` in the repository for the full release summary.
