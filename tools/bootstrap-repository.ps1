[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$')]
    [string]$Repository,

    [ValidateSet('public', 'private')]
    [string]$Visibility = 'public'
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) is not installed or is not on PATH.'
}

gh auth status
if ($LASTEXITCODE -ne 0) {
    throw 'GitHub CLI is not authenticated. Run: gh auth login'
}

$root = Split-Path -Parent $PSScriptRoot
Push-Location $root
try {
    if (-not (Test-Path '.git')) {
        git init
        git branch -M main
    }

    git add README.md LICENSE.txt CHANGELOG.md SECURITY.md RELEASE_CHECKLIST.md RELEASE_NOTES_v1.md .gitignore .gitattributes tools
    $hasHead = $true
    git rev-parse --verify HEAD *> $null
    if ($LASTEXITCODE -ne 0) { $hasHead = $false }

    $pending = git status --porcelain
    if ($pending) {
        git commit -m 'Prepare MJMP binary release repository'
    } elseif (-not $hasHead) {
        throw 'No files were available to create the initial commit.'
    }

    gh repo view $Repository *> $null
    if ($LASTEXITCODE -ne 0) {
        gh repo create $Repository "--$Visibility" --source . --remote origin --push --description 'MJMP portable Windows multimedia player'
    } else {
        if (-not (git remote get-url origin 2>$null)) {
            git remote add origin "https://github.com/$Repository.git"
        }
        git push -u origin main
    }
}
finally {
    Pop-Location
}
