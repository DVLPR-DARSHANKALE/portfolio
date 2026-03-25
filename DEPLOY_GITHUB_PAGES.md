# Deploy Flutter Web to GitHub Pages

## Recommended repo structure

Keep only the Flutter source project in the repository root:

- `lib/`
- `web/`
- `assets/`
- `android/`
- `ios/`
- `pubspec.yaml`
- `.github/workflows/deploy-pages.yml`

Do not keep a copied web build in the repo root. Flutter generates deploy files inside `build/web`.

## Important base href rule

GitHub Pages project sites use this URL pattern:

`https://<username>.github.io/<repo-name>/`

So Flutter web must be built with:

`--base-href /<repo-name>/`

Example:

If your repo name is `portfolio`, build with:

`flutter build web --release --base-href /portfolio/`

If the base href is wrong, the page may open as a blank white screen because `main.dart.js`, assets, and CanvasKit files are requested from the wrong path.

## GitHub Actions deployment

This repo already includes a workflow in `.github/workflows/deploy-pages.yml` that automatically uses the current repository name as the base href.

Use this if you want GitHub to build and deploy for you.

## Manual deployment to GitHub Pages

If you want to deploy manually on the `main/docs` setup, use only the contents of `build/web`.

Steps:

1. Replace `<repo-name>` below with your real GitHub repository name.
2. Build Flutter web.
3. Copy only `build/web/*` into `docs/`.
4. Add a `docs/.nojekyll` file.
5. In GitHub Pages settings, choose `Branch: main` and `Folder: /docs`.

Commands:

```powershell
flutter clean
flutter pub get
flutter build web --release --base-href /<repo-name>/

if (Test-Path docs) { Remove-Item docs\* -Recurse -Force }
New-Item -ItemType Directory -Force docs | Out-Null
Copy-Item build\web\* docs -Recurse -Force
New-Item docs\.nojekyll -ItemType File -Force | Out-Null
```
