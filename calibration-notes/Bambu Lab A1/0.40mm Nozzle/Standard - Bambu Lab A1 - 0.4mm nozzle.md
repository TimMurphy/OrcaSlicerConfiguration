# Calibration Logs

## Nozzle Temperature Test – 0.4 mm | 20 July 2025

- **Filament**: Bambu PLA Basic (White)
- **Print Temp Range**: 190–230 °C
- **Recommended Temp**: 200–205 °C
- **Layer Adhesion**: Consistently strong, slightly better in lower zones
- **Stringing**: None observed
- **Overhangs**: Smooth and flatter from 190–210 °C; roughness above 210 °C
- **Surface Finish**: Subtle shift from matte to glossy; uniform across tower
- **Seam Artifacts**: None detected
- **Color Stability**: Consistent—no signs of overheat or burn

*Notes*: Mesh repair was applied to correct non-manifold edges. “Detect Thin Walls” enabled in slicer. Temperature range narrowed based on visual and tactile assessment.

## 🧪 Flowrate Test – Pass1 | 20 July 2025

- **Model**: Standard line width calibration panels
- **Filament**: Bambu PLA Basic (White)  
- **Printer**: Bambu A1  
- **Layer Height**: 0.2 mm  
- **Flow Ratio**: changes from 0.98 to 1.02  

### 🔍 Observations

- **Corner Quality**: Uniform and clean across all quadrants; TL and BR corners previously rough now fall well within acceptable limits  
- **Extrusion Lines**: Smooth and stable; top surface visually more consistent with stronger line integrity  
- **Wall Widths**: Remain difficult to measure due to lack of elevation; visually appear closer to expected width  
- **Infill**: Consistent, with no noticeable buckling or spacing irregularities  
- **Fingernail Test** (Surface Texture):  
  - TL → BR: reduced resistance compared to prior test  
  - TR → BL: consistently smooth  
- **Rating**:  
  - `0`: near-perfect balance between smoothness, texture, and extrusion control  

---

## 🧪 Flowrate Test – Pass2 | 21 July 2025

- **Model**: Dynamic flowrate calibration panels
- **Filament**: Bambu PLA Basic (White)  
- **Printer**: Bambu A1  
- **Layer Height**: 0.2 mm  
- **Flow Ratio**: 1.02  

### 🔍 Observations

- **Extrusion Consistency**: Stable across variable speed and line width zones; no rippling or artifacts observed  
- **Top Surface Quality**: Consistent and clean across all features  
- **Corner Quality**: All quadrants maintained crisp geometry; BR corner showed minor roughness but within acceptable tolerance  
- **Infill & Line Transitions**: Smooth and well-bonded; no visible underfill or overlap  
- **Surface Texture**: Uniform across directional moves, with no pressure-related distortion

### 🧠 Interpretation

- Flow ratio of `1.02` continues to perform reliably under dynamic print conditions  
- BR corner roughness noted in all samples, likely directional artifact—not flow-induced  
- No speed-dependent anomalies observed; extrusion control appears robust

## 🧪 Flowrate Test – Pass3 (YOLO) | 21 July 2025

- **Model**: Dynamic flowrate test – aggressive conditions  
- **Filament**: Bambu PLA Basic (White)  
- **Printer**: Bambu A1  
- **Layer Height**: 0.2 mm  
- **Flow Ratio**: 1.02  

### 🔍 Observations

- **Overall Quality**: All zones printed cleanly under higher speed and pressure variation  
- **Top Surface**: Uniform finish across sections; consistent layer bonding  
- **Corner Fidelity**: TL, TR, and BL corners remained sharp and smooth  
- **BR Corner**: Slight roughness, consistent with prior tests—still within acceptable tolerances  
- **Line Behavior**: No signs of distortion or pressure instability during transitions

### 🧠 Interpretation

- Flow ratio continues to perform well even under high-demand slicing  
- BR corner roughness likely linked to directional or cooling pattern—not flow control  
- Validates extrusion profile for real-world speed and geometry shifts

## 🧪 Flowrate Test – Pass4 (YOLO – Perfectionist) | 21 July 2025

- **Model**: Advanced flowrate validation – max variation  
- **Filament**: Bambu PLA Basic (White)  
- **Printer**: Bambu A1  
- **Layer Height**: 0.2 mm  
- **Flow Ratio**: 1.02  

### 🔍 Observations

- **Overall Print Quality**: Flawless across speed zones and line width variations  
- **Surface Texture**: Uniform and smooth throughout  
- **Detail Fidelity**: Fine features and transitions rendered cleanly  
- **Corner Quality**: TL, TR, BL corners crisp; BR slightly rough but within tolerance  
- **Infill & Line Behavior**: Consistent bonding and directional stability

### 🧠 Interpretation

- Validates flow ratio under high-performance slicing parameters  
- BR corner artifact persisted subtly across all passes—likely tied to geometry or directional stress  
- Calibration suite confirms extrusion confidence for production-grade workflows

## 🧪 Pressure Advance Calibration

### Pass5 – PA Tower (`0.020 → 0.070`, Step: `0.010`)  
- **Observation**: Corners improved; mid-back separation persisted  
- **Interpretation**: PA ≈ `0.030 – 0.040` likely optimal

### Pass6 – PA Tower (`0.025 → 0.050`, Step: `0.005`)  
- **Observation**: Crisp corners; reduced back separation  
- **Interpretation**: PA narrowing successful; visual improvement

### Pass7 – PA Tower (`0.030 → 0.045`, Step: `0.005`)  
- **Observation**: Cleanest result; corners sharp, back separation minimal  
- **Final PA**: **0.037**

---

## ✅ Confirmed Calibration Settings

| Category     | Value                   |
|--------------|-------------------------|
| Printer      | Bambu A1                |
| Filament     | Bambu PLA Basic (White) |
| Flow Ratio   | `1.02`                  |
| PA Value     | `0.037`                 |
| Layer Height | `0.2 mm`              |

