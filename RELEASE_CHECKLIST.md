# MJMP Release Checklist

## 1. Build the release binary

From the private MJMP source tree, run `run.bat`.

A successful build must produce both:

```text
dist\MJMPv1.exe
dist\SHA256SUMS.txt
```

`run.bat` generates `SHA256SUMS.txt` automatically from the exact executable copied into `dist`.

## 2. Verify the checksum locally

```powershell
$exe = "C:\dev\repos\private\MJMP\MJMPv1\dist\MJMPv1.exe"
$sum = "C:\dev\repos\private\MJMP\MJMPv1\dist\SHA256SUMS.txt"

$actual = (Get-FileHash $exe -Algorithm SHA256).Hash.ToLowerInvariant()
$expected = ((Get-Content $sum -Raw).Trim() -split '\s+')[0].ToLowerInvariant()
$actual
$expected
$actual -eq $expected
```

The final line must be `True`.

## 3. Verify portability

Run `dumpbin /dependents` against `MJMPv1.exe` and confirm there are no third-party codec/runtime DLL imports such as FFmpeg, OpenMPT, dav1d, VVdeC, `VCRUNTIME*.dll`, or `MSVCP*.dll`.

## 4. Update public documentation

- Update `CHANGELOG.md`.
- Update release notes for the target public version.
- Refresh screenshots if the visible UI changed.
- Confirm README links and version references.

## 5. Create the GitHub release

For version `1`:

- Tag: `v1`
- Target: `main`
- Release title: `MJMP v1`
- Pre-release: **off**
- Set as latest release: **on**

Attach exactly:

```text
MJMPv1.exe
SHA256SUMS.txt
```

Do not commit either release asset to the repository tree.

## 6. Post-publication verification

- Download both assets from GitHub as a user would.
- Verify the downloaded executable against the published checksum.
- Launch the downloaded binary.
- Confirm the release is visible as the repository's latest stable release.
- Confirm MJMP's update checker resolves this repository correctly.
