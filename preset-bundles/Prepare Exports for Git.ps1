<#
.SYNOPSIS
Renames *.orca* files to *.zip, extracts them, and deletes the archives.

.DESCRIPTION
Ideal for working with legacy .orca files that are actually ZIP archives.
Streamlines renaming, extraction, and automatic cleanup.

.NOTES
- Run by double-clicking the .ps1 file.
#>

try {
    $sourcePath = $PSScriptRoot
    Set-Location -Path $sourcePath

    Write-Host "`n📂 Working in folder: $sourcePath`n" -ForegroundColor Cyan

    # Step 1: Rename *.orca* files to *.zip
    $orcaFiles = Get-ChildItem -Path $sourcePath -Filter "*.orca*"
    if ($orcaFiles.Count -eq 0) {
        Write-Host "⚠️ No matching .orca files found." -ForegroundColor Yellow
    } else {
        Write-Host "🔄 Renaming .orca files to .zip..." -ForegroundColor Green
        foreach ($file in $orcaFiles) {
            $newName = $file.Name -replace '\.orca.*$', '.zip'
            Rename-Item -Path $file.FullName -NewName $newName
            Write-Host "✔️ Renamed: $($file.Name) → $newName"
        }
    }

    # Step 2: Extract .zip contents and delete archive
    $zipFiles = Get-ChildItem -Path $sourcePath -Filter "*.zip"
    if ($zipFiles.Count -eq 0) {
        Write-Host "`n⚠️ No zip files found to extract." -ForegroundColor Yellow
    } else {
        Write-Host "`n📦 Extracting zip files..." -ForegroundColor Green
        foreach ($zip in $zipFiles) {
            $destinationFolder = Join-Path $sourcePath $zip.BaseName
            try {
                Expand-Archive -Path $zip.FullName -DestinationPath $destinationFolder -Force
                Write-Host "📁 Extracted to: $destinationFolder"

                # Safe cleanup
                Remove-Item -Path $zip.FullName -Force
                Write-Host "🗑️ Deleted: $($zip.Name)"
            }
            catch {
                Write-Host "❌ Failed to extract or delete: $($zip.Name)" -ForegroundColor Red
            }
        }
    }

    # Step 3: Delete all bundle_structure.json files
    $bundleStructureFiles = Get-ChildItem -Path $sourcePath -Recurse -Filter "bundle_structure.json"
    if ($bundleStructureFiles.Count -eq 0) {
        Write-Host "`n⚠️ No bundle_structure.json files found." -ForegroundColor Yellow
    } else {
        Write-Host "`n🗑️ Deleting bundle_structure.json files..." -ForegroundColor Green
        foreach ($file in $bundleStructureFiles) {
            try {
                Remove-Item -Path $file.FullName -Force
                Write-Host "✔️ Deleted: $($file.FullName)"
            }
            catch {
                Write-Host "❌ Failed to delete: $($file.FullName)" -ForegroundColor Red
            }
        }
    }

    Write-Host "`n✅ All done!" -ForegroundColor Cyan
}
catch {
    Write-Host "`n❌ Script error: $($_.Exception.Message)" -ForegroundColor Red
}

# Keep console open for review
Write-Host "`n`nPress any key to exit..."
[void][System.Console]::ReadKey($true)