# MJMP v1.1.1.1

MJMP v1.1.1.1 is a critical hotfix release for the v1.1.1 line. It keeps the v1.1.1 renderer/media architecture intact and fixes the remaining playback-clock and non-client resize interaction defects found after publication.

## Critical fixes

- Fixed current/remaining time and playback progress becoming stale during uninterrupted playback because the retained transport projection had an arbitrary one-minute lifetime.
- Fixed post-seek current/remaining/progress state remaining pinned until another UI event refreshed the semantic transport snapshot. Seek-release convergence now follows the authoritative transport seek epoch rather than depending on renderer-specific presentation evidence.
- Fixed the final hover dependency in the current/remaining-time badge. The badge damage classifier now derives its visible second from the same QPC-projected retained transport position used by the player UI, so it advances with no pointer movement over the seek bar, volume control, or transport controls.
- Fixed stationary clicks on window resize borders/corners briefly exposing the fallback gray/black playback surface. A press/release with no geometry delta is now a strict no-op and does not enter the replacement resize-shell path.

## Architecture retained

- Native D3D11 remains the single application-UI and interaction compositor for both renderer selections.
- D3D12 remains production-video-only.
- Playback progress remains display-cadenced and uses the retained high-resolution transport clock.
- The FFmpeg 9.0.1 A2/A3 media stack and bundled codec-library versions are unchanged from v1.1.1.

## Release identity

```text
Public version:   1.1.1.1
GitHub tag:       v1.1.1.1
Build milestone:  M6.21.322qfju
FileVersion:      1.1.1.1
ProductVersion:   1.1.1.1
Executable:       MJMPv1.1.1.1.exe
Release archive:  MJMPv1.1.1.1.zip
```

## Release assets

The primary distribution archive is `MJMPv1.1.1.1.zip`. The release page also publishes generated SHA-256 integrity data. The ZIP contains the portable `MJMPv1.1.1.1.exe`, these release notes and the license.

Verify the archive in PowerShell:

```powershell
Get-FileHash .\MJMPv1.1.1.1.zip -Algorithm SHA256
Get-Content .\SHA256SUMS.txt
```

The values must match exactly.

## Distribution

MJMP remains a portable Windows x64 application. No installer or external codec pack is required.

> Windows may display its normal reputation/security prompt for a newly published unsigned executable. Download MJMP from this repository's Releases page and verify the published SHA-256 checksum when desired.
