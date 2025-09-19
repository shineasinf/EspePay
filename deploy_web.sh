#!/bin/bash
# deploy_web.sh
# Usage: sh deploy_web.sh "commit message"

# Stop kalau ada error
set -e

# Simpan pesan commit dari argumen, default "deploy build"
COMMIT_MSG=${1:-"deploy build"}

# Pastikan di branch main
git checkout main

# Build web
flutter build web

# Pindah ke gh-pages
git checkout gh-pages

# Hapus isi lama
git rm -rf .

# Copy hasil build
cp -r build/web/* .

# Tambah file .nojekyll kalau belum ada
if [ ! -f ".nojekyll" ]; then
  touch .nojekyll
fi

# Ganti base href di index.html
sed -i '' 's|<base href="/">|<base href="/EduConnect/">|' index.html

# Commit dan push
git add .
git commit -m "$COMMIT_MSG"
git push origin gh-pages

# Balik lagi ke main
git checkout main

echo "✅ Deploy selesai: $COMMIT_MSG"
