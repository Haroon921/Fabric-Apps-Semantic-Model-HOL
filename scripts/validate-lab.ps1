[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()

$requiredFiles = @(
    'README.md',
    'LICENSE',
    'Fabric-Apps-Semantic-Model-HOL.pptx',
    'docs\architecture.svg',
    'docs\INSTRUCTOR_GUIDE.md',
    'docs\LAB_GUIDE.md',
    'docs\PARTNER_ACCESS.md',
    'docs\PRICING.md',
    'docs\SETUP_CHECKLIST.md',
    'docs\VALIDATION_BASELINE.md',
    'docs\visual-semantic-app.png',
    'docs\visual-workshop.png',
    'prompts\copilot-prompts.md',
    'sample-data\fact-opportunities.csv',
    'sample-data\partner-opportunity-sample.xlsx'
)

foreach ($relativePath in $requiredFiles) {
    if (-not (Test-Path (Join-Path $root $relativePath))) {
        $errors.Add("Missing required file: $relativePath")
    }
}

$markdownFiles = Get-ChildItem $root -Recurse -Filter '*.md' -File |
    Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }

foreach ($file in $markdownFiles) {
    $text = Get-Content $file.FullName -Raw
    $matches = [regex]::Matches(
        $text,
        '(?<!!)\[[^\]]+\]\(([^)#]+)(?:#[^)]+)?\)|!\[[^\]]*\]\(([^)#]+)(?:#[^)]+)?\)'
    )

    foreach ($match in $matches) {
        $target = if ($match.Groups[1].Success) {
            $match.Groups[1].Value
        }
        else {
            $match.Groups[2].Value
        }

        if ($target -and $target -notmatch '^(https?://|mailto:)') {
            $resolved = Join-Path $file.DirectoryName ([uri]::UnescapeDataString($target))
            if (-not (Test-Path $resolved)) {
                $errors.Add("$($file.FullName): missing link target '$target'")
            }
        }
    }
}

try {
    [xml](Get-Content (Join-Path $root 'docs\architecture.svg') -Raw) | Out-Null
}
catch {
    $errors.Add("Invalid architecture SVG: $($_.Exception.Message)")
}

$rows = @(Import-Csv (Join-Path $root 'sample-data\fact-opportunities.csv'))
$totalAcr = ($rows | Measure-Object ACR_USD -Sum).Sum
$won = @($rows | Where-Object Stage -eq 'Won')
$wonAcr = ($won | Measure-Object ACR_USD -Sum).Sum

if ($rows.Count -ne 240) {
    $errors.Add("Expected 240 opportunity rows; found $($rows.Count)")
}
if ($totalAcr -ne 27705000) {
    $errors.Add("Expected Total ACR 27705000; found $totalAcr")
}
if ($won.Count -ne 52) {
    $errors.Add("Expected 52 won opportunities; found $($won.Count)")
}
if ($wonAcr -ne 6021000) {
    $errors.Add("Expected Won ACR 6021000; found $wonAcr")
}

$textExtensions = @('.md', '.ps1', '.yml', '.yaml', '.json', '.js', '.jsx', '.ts', '.tsx', '.txt')
$secretPatterns = @(
    '(?i)(api[_-]?key|access[_-]?token|client[_-]?secret|password)\s*[:=]\s*["''][^"'']{8,}',
    ('gh' + '[pousr]_[A-Za-z0-9]{20,}'),
    ('AKIA' + '[A-Z0-9]{16}')
)

$textFiles = Get-ChildItem $root -Recurse -File |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        $textExtensions -contains $_.Extension.ToLowerInvariant()
    }

foreach ($file in $textFiles) {
    $text = Get-Content $file.FullName -Raw
    foreach ($pattern in $secretPatterns) {
        if ($text -match $pattern) {
            $errors.Add("Potential secret detected in $($file.FullName)")
            break
        }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Lab validation passed."
Write-Host "  Required files: $($requiredFiles.Count)"
Write-Host "  Markdown files: $($markdownFiles.Count)"
Write-Host "  Opportunity rows: $($rows.Count)"
Write-Host "  Total ACR: $totalAcr"
Write-Host "  Won opportunities: $($won.Count)"
Write-Host "  Won ACR: $wonAcr"
