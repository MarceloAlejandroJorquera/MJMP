# MJMP Release Checklist

This checklist applies to the public binary-release workflow.

## 1. Build the release binary

From the private MJMP source tree, run:

```text
run.bat
```

A successful release build must produce:

```text
dist\MJMPv1.exe
dist\SHA256SUMS.txt
```

The build generates `SHA256SUMS.txt` from the exact executable copied into `dist`.

## 2. Verify the checksum locally

From the private project root:

```powershell
$exe = ".\dist\MJMPv1.exe"
$sum = ".\dist\SHA256SUMS.txt"

$actual = (Get-FileHash $exe -Algorithm SHA256).Hash.ToLowerInvariant()
$expected = ((Get-Content $sum -Raw).Trim() -split '\s+')[0].ToLowerInvariant()

$actual
$expected
$actual -eq $expected
```

The final line must be:

```text
True
```

## 3. Verify portability

From a Visual Studio developer shell:

```powershell
dumpbin /dependents .\dist\MJMPv1.exe
```

Confirm that the release does not import third-party codec/runtime DLLs such as:

```text
avcodec
avformat
avutil
swscale
swresample
openmpt
dav1d
vvdec
vcruntime
msvcp
```

The release is expected to import normal Windows system DLLs.

## 4. Refresh public documentation

Review:

- `README.md`
- `CHANGELOG.md`
- the release-specific notes
- `SECURITY.md`
- screenshots when visible UI changes
- public version references
- download/release links

## 5. Commit documentation changes

Review the working tree:

```powershell
git status
git diff
```

Then stage, commit and push:

```powershell
git add .
git status
git commit -m "Refresh public release documentation"
git push origin main
```

Do not commit `MJMPv1.exe` or `SHA256SUMS.txt` to the normal repository tree.

## 6. Create or update the GitHub release

For public version `1`:

```text
Tag: v1
Target: main
Title: MJMP v1
Pre-release: off
Latest release: on
```

Attach:

```text
MJMPv1.exe
SHA256SUMS.txt
```

## 7. Post-publication verification

After publication:

1. Download both release assets from GitHub.
2. Verify the downloaded binary against `SHA256SUMS.txt`.
3. Launch the downloaded executable.
4. Confirm the release is marked as the latest stable release.
5. Confirm README/release links work.
6. Confirm MJMP's update checker resolves `MarceloAlejandroJorquera/MJMP`.
