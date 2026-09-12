# MJMP GitHub Release Checklist

1. Create the GitHub repository and push this publication skeleton.
2. Decide the final repository slug, e.g. `OWNER/MJMP`.
3. Set MJMP's build-time `MJMP_GITHUB_REPOSITORY` to that exact `OWNER/MJMP` slug.
4. Set `MJMP_PUBLIC_VERSION` to the numeric public version, e.g. `1`.
5. Rebuild the final x64 Release executable.
6. Re-run `dumpbin /dependents MJMPv1.exe` and verify no third-party runtime DLL imports were introduced.
7. Smoke-test the single EXE on another Windows machine/VM when possible.
8. Run `tools\publish-release.ps1` to upload `MJMPv1.exe` and its SHA-256 manifest as GitHub Release assets.
9. Confirm the release is neither Draft nor Prerelease; MJMP queries GitHub's `/releases/latest` endpoint.
10. Launch the prior MJMP build and confirm the new release notification appears after the GitHub release is live.

Do **not** commit `MJMPv1.exe` to the repository tree. Keep the repository binary-only by distributing the executable through GitHub Release assets.
