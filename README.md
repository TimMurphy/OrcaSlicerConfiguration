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

4. Use Git to stage and commit with clear annotations.

---

## 🧪 Calibration Logs

Calibration results and tuning notes are organized by printer and nozzle size, with one markdown file per preset configuration. Use the following folder structure:

`calibration-notes/<printer>/<nozzle>/<preset>.md`

Examples:

- `calibration-notes/Bambu Lab A1/0.40mm Nozzle/Standard - Bambu Lab A1 - 0.4mm nozzle.md`  
- `calibration-notes/Bambu Lab A1/0.80mm Nozzle/High Flow - Bambu Lab A1 - 0.8mm nozzle.md`

Each log includes date-stamped test results for flowrate, temperature, cooling behavior, and visual artifacts.

---

## 📦 Test Models

All calibration models (.3mf) used for validating presets are stored in:

`test-models/`

These models include geometry-specific benchmarks for overhang, bridging, flowrate, and dimensional accuracy. They are part of Orca Slicer's calibration suite.

---

## 🔧 Tools & Tech Stack

- 🖨️ **Printer**: Bambu A1  
- 🧵 **Slicer**: Orca Slicer  
- 🧰 **CAD Integration**: Fusion 360  
- 🗃️ **Version Control**: Git  
- 🧠 **Workflow Companion**: Copilot (aka *Brains*)