[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$')]
    [string]$Repository,

    [Parameter(Mandatory = $true)]
    [ValidatePattern('^\d+(?:\.\d+)*$')]
    [string]$Version,

    [Parameter(Mandatory = $true)]
    [string]$ExePath,

    [string]$NotesFile
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) is not installed or is not on PATH.'
}

gh auth status
if ($LASTEXITCODE -ne 0) {
    throw 'GitHub CLI is not authenticated. Run: gh auth login'
}

$resolvedExe = (Resolve-Path -LiteralPath $ExePath).Path
if ([IO.Path]::GetFileName($resolvedExe) -ne 'MJMPv1.exe') {
    throw 'The release asset must be named MJMPv1.exe.'
}

if ([string]::IsNullOrWhiteSpace($NotesFile)) {
    $candidate = Join-Path (Split-Path -Parent $PSScriptRoot) "RELEASE_NOTES_v$Version.md"
    if (Test-Path -LiteralPath $candidate) {
        $NotesFile = $candidate
    } else {
        $NotesFile = Join-Path (Split-Path -Parent $PSScriptRoot) 'RELEASE_NOTES_v1.md'
    }
}
$resolvedNotes = (Resolve-Path -LiteralPath $NotesFile).Path

$tag = "v$Version"
$temp = Join-Path ([IO.Path]::GetTempPath()) ("mjmp-release-" + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $temp | Out-Null
try {
    $hashPath = Join-Path $temp 'SHA256SUMS.txt'
    $hash = (Get-FileHash -LiteralPath $resolvedExe -Algorithm SHA256).Hash.ToLowerInvariant()
    Set-Content -LiteralPath $hashPath -Encoding ascii -NoNewline -Value "$hash  MJMPv1.exe`r`n"

    gh repo view $Repository *> $null
    if ($LASTEXITCODE -ne 0) {
        throw "GitHub repository '$Repository' was not found or is not accessible."
    }

    gh release view $tag --repo $Repository *> $null
    if ($LASTEXITCODE -eq 0) {
        throw "Release '$tag' already exists. Refusing to overwrite it."
    }

    Write-Host "Publishing MJMP $tag to $Repository"
    Write-Host "SHA256: $hash"

    gh release create $tag `
        "$resolvedExe#MJMPv1.exe" `
        "$hashPath#SHA256SUMS.txt" `
        --repo $Repository `
        --target main `
        --title "MJMP $tag" `
        --notes-file $resolvedNotes

    if ($LASTEXITCODE -ne 0) {
        throw 'GitHub release creation failed.'
    }

    Write-Host "Published $tag successfully."
}
finally {
    Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue
}
