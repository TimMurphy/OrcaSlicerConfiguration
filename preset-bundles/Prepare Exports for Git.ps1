<# 
.SYNOPSIS
Modular script for renaming *.orca* files to *.zip, extracting them, cleaning up archives,
deleting all subfolders, and removing bundle_structure.json files.

.DESCRIPTION
Built for managing legacy .orca archives while maintaining a clean working folder.

.NOTES
- Save as .ps1 and run from the containing folder.
- Each step is wrapped as a standalone function for reuse and scalability.
#>

function Remove-SubFolders {
    Write-Host "🗑️ Deleting subfolders..." -ForegroundColor Green
    $subFolders = Get-ChildItem -Path $sourcePath -Directory
    foreach ($folder in $subFolders) {
        try {
            Remove-Item -Path $folder.FullName -Recurse -Force
            Write-Host "✔️ Deleted folder: $($folder.FullName)"
        }
        catch {
            Write-Host "❌ Failed to delete folder: $($folder.FullName)" -ForegroundColor Red
        }
    }
}

function Rename-OrcaToZip {
    Write-Host "`n🔄 Renaming .orca files to .zip..." -ForegroundColor Green
    $orcaFiles = Get-ChildItem -Path $sourcePath -Filter "*.orca*"
    foreach ($file in $orcaFiles) {
        $newName = $file.Name -replace '\.orca.*$', '.zip'
        Rename-Item -Path $file.FullName -NewName $newName
        Write-Host "✔️ Renamed: $($file.Name) → $newName"
    }
}

function Extract-ZipAndDelete {
    Write-Host "`n📦 Extracting zip files..." -ForegroundColor Green
    $zipFiles = Get-ChildItem -Path $sourcePath -Filter "*.zip"
    foreach ($zip in $zipFiles) {
        $destinationFolder = Join-Path $sourcePath $zip.BaseName
        try {
            Expand-Archive -Path $zip.FullName -DestinationPath $destinationFolder -Force
            Write-Host "📁 Extracted to: $destinationFolder"
            Remove-Item -Path $zip.FullName -Force
            Write-Host "🗑️ Deleted: $($zip.Name)"
        }
        catch {
            Write-Host "❌ Failed: $($zip.Name)" -ForegroundColor Red
        }
    }
}

function Remove-BundleStructureFiles {
    Write-Host "`n🗑️ Removing bundle_structure.json files..." -ForegroundColor Green
    $bundleFiles = Get-ChildItem -Path $sourcePath -Recurse -Filter "bundle_structure.json"
    foreach ($file in $bundleFiles) {
        try {
            Remove-Item -Path $file.FullName -Force
            Write-Host "✔️ Deleted: $($file.FullName)"
        }
        catch {
            Write-Host "❌ Failed to delete: $($file.FullName)" -ForegroundColor Red
        }
    }
}

# Main block
try {
    $sourcePath = $PSScriptRoot
    Set-Location -Path $sourcePath
    Write-Host "`n📂 Working in folder: $sourcePath`n" -ForegroundColor Cyan

    Remove-SubFolders
    Rename-OrcaToZip
    Extract-ZipAndDelete
    Remove-BundleStructureFiles

    Write-Host "`n✅ All done!" -ForegroundColor Cyan
}
catch {
    Write-Host "`n❌ Script error: $($_.Exception.Message)" -ForegroundColor Red
}

# Keep console open for review
Write-Host "`n`nPress any key to exit..."
[void][System.Console]::ReadKey($true)