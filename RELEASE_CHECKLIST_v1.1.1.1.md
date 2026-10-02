# MJMP v1.1.1.1 public release checklist

## Runtime qualification

- [x] Uninterrupted playback current/remaining/progress remains live beyond the former one-minute failure point.
- [x] Current/remaining/progress resumes after seeking without requiring hover, pause/resume, or another control interaction.
- [x] Current/remaining badges advance with the pointer completely idle.
- [x] Stationary resize-border/corner click/release no longer flashes the fallback playback background.

## Public repository

- [ ] Apply the v1.1.1.1 public documentation refresh to the clean v1.1.1 public baseline.
- [ ] Confirm `README.md`, `CHANGELOG.md`, `RELEASE_NOTES_v1.1.1.1.md`, `GITHUB_RELEASE_BODY_v1.1.1.1.md`, `RELEASE_CHECKLIST_v1.1.1.1.md`, `SECURITY.md`, and `docs/ARCHITECTURE.md`.
- [ ] Review `git diff` and confirm no private source/build artifacts are present.
- [ ] Commit the public documentation as `Release MJMP v1.1.1.1 documentation`.
- [ ] Push `main`.

## Final release assets

- [ ] Build/finalize the qualified `MJMPv1.1.1.1.exe` from the M6.21.322qfju private tree.
- [ ] Generate `MJMPv1.1.1.1.zip`.
- [ ] Generate `MJMPv1.1.1.1.zip.sha256` and `SHA256SUMS.txt`.
- [ ] Confirm the ZIP contains `MJMPv1.1.1.1.exe`, `RELEASE_NOTES_v1.1.1.1.md`, and `LICENSE.txt`.
- [ ] Verify the generated hashes against the staged assets.

## GitHub release

- [ ] Create annotated tag `v1.1.1.1` on the public documentation commit and push it.
- [ ] Create release `MJMP v1.1.1.1` from tag `v1.1.1.1`.
- [ ] Mark it as the latest release.
- [ ] Paste `GITHUB_RELEASE_BODY_v1.1.1.1.md` into the release notes field.
- [ ] Upload `MJMPv1.1.1.1.zip`.
- [ ] Upload `MJMPv1.1.1.1.zip.sha256`.
- [ ] Upload `SHA256SUMS.txt`.
- [ ] Publish only after the public documentation commit and tag are visible on GitHub.
