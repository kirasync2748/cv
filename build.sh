#!/bin/bash
set -eu

# Build script for the CV project.
# Compiles the LaTeX and Typst CVs and assembles the site/ directory.
# Requirements: latexmk, texlive, typst, (optional: poppler-utils, imagemagick)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
SITE_DIR="$SCRIPT_DIR/site"
BUILD_DIR=$(mktemp -d)

trap 'rm -rf "$BUILD_DIR"' EXIT

# Copy source to build directory (keeps repo clean of aux files)
cp -a "$SRC_DIR/." "$BUILD_DIR/"
cd "$BUILD_DIR"

# Clean stale aux files
latexmk -C >/dev/null 2>&1 || true

# Build LaTeX CV
echo "Building LaTeX CV..."
latexmk -pdf -interaction=nonstopmode cv.tex

# Build Typst CV
echo "Building Typst CV..."
typst compile main.typ your-name-cv-typst.pdf

# Assemble site
mkdir -p "$SITE_DIR"
cp cv.pdf "$SITE_DIR/your-name-cv.pdf"
cp your-name-cv-typst.pdf "$SITE_DIR/your-name-cv-typst.pdf"
cp "$SCRIPT_DIR/index.html" "$SITE_DIR/index.html"

# Generate social preview image (optional, requires poppler-utils + imagemagick)
if command -v pdftoppm >/dev/null 2>&1 && command -v convert >/dev/null 2>&1; then
  echo "Generating preview image..."
  pdftoppm -f 1 -l 1 -r 300 -png cv.pdf preview
  convert preview-1.png -resize 1200x -crop 1200x630+0+0 +repage \
    \( -size 1200x200 gradient:none-white \) \
    -gravity south -composite \
    "$SITE_DIR/preview.webp"
else
  echo "Skipping preview image (poppler-utils + imagemagick not installed)"
fi

echo "Done. Site output in $SITE_DIR/"
