#!/data/data/com.termux/files/usr/bin/bash
# Run inside Termux: bash publish.sh
set -e
pkg install -y git gh >/dev/null
gh auth status >/dev/null 2>&1 || gh auth login
git config user.name >/dev/null || git config --global user.name "$(gh api user -q .login)"
git config user.email >/dev/null || git config --global user.email "$(gh api user -q .login)@users.noreply.github.com"
read -p "Repo name [starburg]: " N; N=${N:-starburg}
[ -d .git ] || git init -b main
git add -A; git commit -m "Starburg Android app" || true
gh repo create "$N" --public --source=. --push
git tag v1.0 && git push origin v1.0
echo "Done. Watch the build: gh run watch   |  APK appears under Releases."
