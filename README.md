# 🧊 Orca Slicer Configuration Repository

## 📝 Overview

This repository version-controls slicing configurations for **3D printing on the Bambu A1**. It tracks printer profiles, filament settings, slicing processes, calibration models, and annotated results to support **repeatability**, **traceability**, and long-term **workflow optimization**.

---

## ⚙️ Base Preset Creation

Initial presets were derived from Orca Slicer’s default configuration set and saved as:

| Preset Type | Name |
|-------------|------|
| Printer     | `Standard – Bambu Lab A1 – 0.4mm nozzle` |
| Material    | `Standard – Bambu PLA Basic – 0.40mm nozzle` |
| Process     | `Standard – Bambu PLA Basic – 0.40mm nozzle` |

These serve as baseline references for customized slicing workflows.

---

## 📤 Exporting & Versioning Presets

To ensure version consistency and commit hygiene:

1. In Orca Slicer, go to  
   `File → Export → Export Preset Bundle...`

2. Export all relevant bundles:

   - Printer config bundle  
   - Filament bundle  
   - Printer presets  
   - Filament presets  
   - Process presets

3. Run `Prepare Exports for Git.ps1` to format and clean output for repository use.

4. Use Git to stage and commit with clear annotations and semantic version tags.

---

## 🔧 Tools & Tech Stack

- 🖨️ **Printer**: Bambu A1  
- 🧵 **Slicer**: Orca Slicer  
- 🧰 **CAD Integration**: Fusion 360  
- 🗃️ **Version Control**: Git  
- 🧠 **Workflow Companion**: Copilot (aka *Brains*)
