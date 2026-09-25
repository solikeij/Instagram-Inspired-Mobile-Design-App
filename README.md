# Instagram Dark Mode - ITP107 Finals Lab 1

A Flutter demo with validated sign-in and sign-up forms and a dark-mode home feed.
Successful form submission passes the user's display name to Home. Authentication,
password recovery, and feed actions are demo UI only; no backend is connected.

## Requirements

Validated with Flutter 3.47.1 and Dart 3.13.1. Use the same Flutter version as CI
for reproducible dependencies and visual tests.

## Run

```sh
flutter pub get --enforce-lockfile
flutter run -d chrome
```

## Verify

```sh
flutter analyze
flutter test
flutter build web --release --base-href /instagram_dark_lab/
flutter build apk --debug
```

Visual goldens in `test/previews/` are checked locally; CI runs the behavioral
widget tests to avoid platform-specific font rendering differences.

## Deployment

Pushes to `main` build and test the Flutter web app, then publish `build/web`
through GitHub Pages. In repository Settings > Pages, select GitHub Actions
as the publishing source. Android release signing still uses the development
key and must be configured before store distribution.
