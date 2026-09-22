# MJMP v1.1 publication checklist

This checklist reflects the final simplified publication policy and the established Git + GitHub web release workflow.

- [ ] M6.21.317 source contract verifies successfully.
- [ ] `dist\MJMPv1.1.exe` is the already-tested M317 build; do not rebuild it during publication.
- [ ] M315 color qualification is rerun with `Renderer Both` against that exact executable and returns `OVERALL: PASS`.
- [ ] `verify-v1.1-release.ps1 -RequireBinary -RequireColorQualified` passes.
- [ ] The actual final SHA-256 is sealed into `CHANGELOG.md`, `RELEASE_NOTES_v1.1.md`, the freeze record and provenance.
- [ ] A deterministic private-source snapshot manifest/hash is captured for the exact M6.21.317 source tree; the private tree itself does not need to be a Git working tree.
- [ ] Release assets are staged: EXE, ZIP, SHA256SUMS, provenance.
- [ ] Public working tree is canonicalized from `C:\dev\repos\public\MJMP\v1` to `C:\dev\repos\public\MJMP\v1.1` when necessary.
- [ ] Public changelog/release notes/checksums/provenance are committed.
- [ ] Annotated tag `v1.1` points to the public release commit and is pushed.
- [ ] GitHub web release `v1.1` is created from the pushed tag.
- [ ] The four prepared release assets are uploaded and the release is published as latest.

A4 and the separate interaction evidence remain useful engineering diagnostics but are not publication blockers for v1.1.
