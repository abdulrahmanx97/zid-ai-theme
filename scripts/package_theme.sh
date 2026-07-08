#!/usr/bin/env bash
# package_theme.sh — validate + package a Vitrin theme into an upload-ready ZIP.
# Usage: bash package_theme.sh <theme-dir> [output.zip]
set -euo pipefail

DIR="${1:?Usage: package_theme.sh <theme-dir> [output.zip]}"
OUT="${2:-$(basename "$DIR")-$(date +%Y-%m-%d).zip}"
cd "$DIR"

fail() { echo "❌ $1"; exit 1; }
warn() { echo "⚠️  $1"; }
ok()   { echo "✅ $1"; }

# --- 0. Platform guard (this tool is for Zid/Vitrin themes ONLY) ---
if find . -maxdepth 3 -name "*.liquid" -not -path "./node_modules/*" | grep -q . ; then
  fail "Liquid files detected — this looks like a Shopify theme. This tool packages Zid (Vitrin) themes only."
fi
if [ -f twilight.json ] || find . -maxdepth 2 -name "*.twig" -not -path "./node_modules/*" | grep -q . ; then
  fail "Twig/Twilight structure detected — this looks like a Salla theme (or legacy Zid Twig, which is deprecated). This tool packages Zid Vitrin themes only."
fi

# --- 1. Required structure ---
[ -f layout.jinja ] || fail "layout.jinja missing"
grep -q "vitrin_head" layout.jinja || fail "layout.jinja missing {% vitrin_head %}"
grep -q "vitrin_body" layout.jinja || fail "layout.jinja missing {% vitrin_body %}"
[ -d templates ] || fail "templates/ directory missing"
ok "Required structure present (layout.jinja + vitrin tags + templates/)"

# --- 2. Compiled assets ---
if [ -f package.json ]; then
  if [ ! -f assets/styles.css ] || [ ! -d assets/dist ]; then
    warn "Compiled assets missing — building"
    [ -d node_modules ] || { warn "Installing dependencies"; npm install --no-audit --no-fund >/dev/null 2>&1 || fail "npm install failed"; }
    npm run build || fail "npm run build failed"
  fi
fi
[ -f assets/styles.css ] && ok "assets/styles.css present" || warn "no assets/styles.css (ok only if theme has no build step)"

# --- 3. Forbidden files ---
if find . -name "*.mo" -not -path "./node_modules/*" | grep -q .; then
  warn "Removing compiled .mo files (must not be uploaded)"
  find . -name "*.mo" -not -path "./node_modules/*" -delete
fi

# --- 4. Translations check ---
if command -v msgfmt >/dev/null 2>&1; then
  for po in $(find locale locals -name "*.po" 2>/dev/null || true); do
    msgfmt --check "$po" -o /dev/null && ok "PO valid: $po" || fail "PO invalid: $po"
  done
fi

# --- 5. Schema JSON sanity ---
for s in $(find . -maxdepth 2 -name "*.schema.json" -not -path "./node_modules/*"); do
  python3 -c "import json,sys; json.load(open('$s'))" 2>/dev/null || fail "Invalid JSON: $s"
done
ok "All schema JSON files parse"

# --- 6. Package (only what belongs in a theme) ---
rm -f "../$OUT"
zip -rq "../$OUT" . \
  -x "node_modules/*" ".git/*" ".github/*" "build/*" "dist/theme.zip" \
     "*.mo" ".DS_Store" "*/.DS_Store" "npm-debug.log" ".vscode/*" \
     "Makefile" "vite.config.js" "package.json" "package-lock.json" \
     "README.md" "docs/*" ".gitignore" ".prettierrc*" "msgfmt/*"

SIZE=$(du -h "../$OUT" | cut -f1)
ok "Packaged: ../$OUT ($SIZE)"
echo ""
echo "Upload paths:"
echo "  A) Merchant: لوحة التحكم → سوق الثيمات → الثيمات المخصصة → رفع ثيم جديد"
echo "  B) Partner:  vitrin push -s <store> -a   (or Partner Dashboard → My Themes)"
