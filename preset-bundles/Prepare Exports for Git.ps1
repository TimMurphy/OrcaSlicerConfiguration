<# 
.SYNOPSIS
Modular cleanup script for .orca/.zip bundles: deletes subfolders, renames/extracts archives,
removes specific JSON files, and deletes duplicates outside the master preset bundle.

.DESCRIPTION
Ideal for managing OrcaSlicer presets with controlled structure and repeatable cleanup.

.NOTES
- Save as .ps1 and run inside the containing folder.
- Make sure preset-bundles path and master folder name match your structure.
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

function Expand-ZipsAndDelete {
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

function Remove-DuplicateFiles {
    Write-Host "`n🧹 Removing duplicates from non-master folders..." -ForegroundColor Green

    $presetRoot = $sourcePath
    $allFolders = Get-ChildItem -Path $presetRoot -Directory

    Write-Debug "Found $(($allFolders | Measure-Object).Count) folders in $presetRoot"

    # Identify folders matching 'Bambu Lab A1 0.X nozzle'
    $foldersWithPossibleDuplicates = $allFolders | Where-Object {
        $_.Name -match "^Bambu Lab A1 0\.\d.*nozzle$"
    }

    Write-Debug "Found $(($foldersWithPossibleDuplicates | Measure-Object).Count) folders with possible duplicates"

    if ($foldersWithPossibleDuplicates.Count -eq 0) {
        Write-Host "⚠️ No folders matching 'Bambu Lab A1 0.X nozzle' found." -ForegroundColor Yellow
        return
    }

    # All files in with possible duplicates
    $possibleDuplicateFiles = $foldersWithPossibleDuplicates | ForEach-Object {
        Get-ChildItem -Path $_.FullName -Recurse -File
    }

    Write-Debug "Found $(($possibleDuplicateFiles | Measure-Object).Count) possible duplicate files"

    # All other folders (not in the possible duplicates list)
    $keepFolders = $allFolders | Where-Object {
        $_.FullName -notin $foldersWithPossibleDuplicates.FullName
    }

    Write-Debug "Found $(($keepFolders | Measure-Object).Count) folders to keep"
    
    foreach ($keepFolder in $keepFolders) {

        Write-Host "`n🔍 Checking duplicates of files in $($keepFolder.FullName)" -ForegroundColor Cyan

        $keepFiles = Get-ChildItem -Path $keepFolder.FullName -Recurse -File

        foreach ($keepFile in $keepFiles) {

            Write-Host "🔍 Checking is there is a duplicate of $($keepFile.FullName)" -ForegroundColor Cyan

            # Calculate hash for the file in the keep folder
            $keepFileHash = Get-FileHash -Path $keepFile.FullName -Algorithm SHA256

            foreach ($possibleDuplicateFile in $possibleDuplicateFiles) {

                # The duplicate file may not exist because it was already deleted
                if (Test-Path $possibleDuplicateFile.FullName) {

                    # Calculate hash for the possible duplicate file
                    $possibleDuplicateFileHash = Get-FileHash -Path $possibleDuplicateFile.FullName -Algorithm SHA256

                    # If hashes match, delete the duplicate file
                    if ($keepFileHash.Hash -eq $possibleDuplicateFileHash.Hash) {
                        try {
                            Remove-Item -Path $possibleDuplicateFile.FullName -Force
                            Write-Host "🗑️ Deleted duplicate: $($possibleDuplicateFile.FullName)"
                        }
                        catch {
                            Write-Host "❌ Failed to delete: $($keepFile.FullName)" -ForegroundColor Red
                        }
                    }
                }
            }
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
    Expand-ZipsAndDelete
    Remove-BundleStructureFiles
    Remove-DuplicateFiles

    Write-Host "`n✅ All done!" -ForegroundColor Cyan
}
catch {
    Write-Host "`n❌ Script error: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n`nPress any key to exit..."
[void][System.Console]::ReadKey($true)