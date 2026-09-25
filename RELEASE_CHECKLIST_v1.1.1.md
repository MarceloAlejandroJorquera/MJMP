# MJMP v1.1.1 public release checklist

## GitHub release form

- [x] Tag: `v1.1.1`
- [x] Target: `main`
- [x] Previous tag for generated comparison: `v1.1`
- [x] Release title: `MJMP v1.1.1`
- [x] Release label: **Latest**
- [ ] Paste `GITHUB_RELEASE_BODY_v1.1.1.md` into the release notes field.
- [ ] Attach final release assets.
- [ ] Publish only after the public documentation commit is on `main`.

## Final binary

- [x] `MJMPv1.1.1.exe`
- [x] FileVersion `1.1.1.322`
- [x] ProductVersion `1.1.1`
- [x] x64 / PE32+ / Windows GUI
- [x] Portable dependency scan PASS
- [x] Release-tree/binary verifier PASS
- [x] SHA-256 `86ded6a8edc426f1e778f993d98a6187c9f4b16a5eb6936b5a709c618c1487db`

## Upload

- [ ] `MJMPv1.1.1.exe`
- [ ] `SHA256SUMS.txt`
- [ ] `MJMP-v1.1.1-windows-x64.zip`
- [ ] `RELEASE_MANIFEST_v1.1.1.json`
- [ ] `RELEASE_ASSET_SHA256.txt`

## Compatibility regression

- [ ] VP9/WebM hardware-first playback validated under D3D11 and D3D12.
- [ ] Forced/observed VP9 hardware bootstrap fallback reaches direct libvpx and rebuilds reference state cleanly.
- [ ] D3D12 → D3D11 switch during software VP9 keeps ribbon/time/hover/hotkeys live.
- [ ] D3D12 Unbounded remains producer-unbound while the D11 UI stays display-cadenced.

## Public repository

- [ ] `README.md` identifies v1.1.1 and `MJMPv1.1.1.exe`.
- [ ] `CHANGELOG.md` starts with v1.1.1 while preserving v1.1/v1 history.
- [ ] `RELEASE_NOTES_v1.1.1.md` is committed.
- [ ] `docs/ARCHITECTURE.md` documents D11 application-UI ownership and D12 production-video-only role.
- [ ] `git diff` reviewed.
- [ ] `.git` metadata exists at `C:\dev\repos\public\MJMP\V1.1.1`.
- [ ] `tools\` contains the durable v1.1.1 bootstrap/refresh helpers.
- [ ] documentation commit pushed to `main`.
