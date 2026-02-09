
# GIMP Tutorial: Photo to Professional A4 Scan

## Complete Workflow

### 1. Fix Perspective & Extract Document
- Open image: `File → Open`
- **Perspective Tool** (Shift+P)
  - Click the 4 corners of your document
  - Click Transform to make rectangular
- **Crop Tool** (Shift+C) to remove excess

### 2. Sample Background Color
- **Eyedropper Tool** (O)
- Click clean area of document background
- This becomes Foreground Color

### 3. Resize to A4
- Check current DPI: `Image → Print Size`
- Scale if needed: `Image → Scale Image`
  - Set to max 200mm width or 287mm height (keeps margins)
  - Keep proportions (chain linked)
- `Image → Canvas Size`
  - Units: mm
  - Width: 210, Height: 297
  - Center the image
  - Click Resize

### 4. Add Background Layer
- `Layer → New Layer`
  - Fill with: Foreground color
  - Click OK
- In Layers panel: drag below document layer

### 5. Blend Extended Background (Natural Look)
- Select background layer
- **Add paper texture:**
  ```
  Filters → Noise → RGB Noise (0.015-0.020)
  Filters → Blur → Gaussian Blur (0.5-1.0)
  ```
- **Smooth transitions:**
  - Clone Tool (C): sample from document, paint transitions
  - OR: Add slight gradient from edges

### 6. Final Enhancement (Optional)
- Merge layers: `Image → Flatten Image`
- Adjust contrast: `Colors → Levels` or `Auto → White Balance`
- Sharpen: `Filters → Enhance → Unsharp Mask`

### 7. Export
- `File → Export As`
- Save as: document.pdf or document.png

## Key Settings Reference
- **A4 @ 300 DPI**: 2480×3508 pixels
- **A4 @ 200 DPI**: 1654×2339 pixels (good balance)
- **A4 @ 150 DPI**: 1240×1754 pixels (smaller file)
- **Paper texture**: RGB Noise 0.015-0.020 + Blur 0.5-1.0
- **Clone tool**: Soft brush, 80-90% opacity

## Tips
- Work with layers - keep original document and background separate until final merge
- Sample multiple areas when cloning for natural variation
- For OCR: export at 200-300 DPI
- Save XCF project file to preserve layers for future edits
