# widget_cr — ClipRect & ClipRRect Demo

An interactive Flutter app for exploring Flutter's clipping widgets (`ClipRect` and `ClipRRect`) with live mode and behavior switching.

## Screenshot

![ClipRect & ClipRRect Demo](screenshot.png)

> Add a screenshot by running the app, taking a capture, and saving it as `screenshot.png` in the project root.

## Features

- Toggle between **no clip**, **ClipRect**, and **ClipRRect** modes
- Switch clip behaviors: `hardEdge`, `antiAlias`, `antiAliasWithSaveLayer`
- Adjustable corner radius for `ClipRRect`
- Offline fallback — renders a placeholder if the network image fails to load

## Requirements

- Flutter SDK `^3.11.5`
- Dart SDK `^3.11.5`

## Run Steps

**1. Clone the repo**
```bash
git clone <repo-url>
cd widget_cr
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Run on a connected device or simulator**
```bash
flutter run
```

To target a specific platform explicitly:
```bash
flutter run -d chrome      # Web
flutter run -d macos       # macOS desktop
flutter run -d android     # Android emulator / device
flutter run -d ios         # iOS simulator / device
```

**4. Run tests**
```bash
flutter test
```

## Project Structure

```
lib/
├── main.dart           # App entry point
└── screens/
    └── clip.dart       # ClipPage widget — all demo logic lives here
```

## Attribute Notes

| Item | Source | Notes |
|---|---|---|
| Demo image | [picsum.photos](https://picsum.photos) | Loaded at runtime via `Image.network`. Falls back to a solid-color placeholder when offline. |
| Icons | Flutter `cupertino_icons ^1.0.8` | Bundled via `pubspec.yaml` |
| Clip widgets | Flutter SDK (`ClipRect`, `ClipRRect`) | Core Material library — no external packages required |

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK | UI framework |
| `cupertino_icons` | `^1.0.8` | iOS-style icon set |
| `flutter_lints` | `^6.0.0` | Lint rules (dev) |

---

Author: Habeeb Dindi — ALU Mobile Development
