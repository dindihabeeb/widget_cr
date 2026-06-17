# Widget Presentation — ClipRect & ClipRRect Demo

An interactive Flutter app for exploring Flutter's clipping widgets (`ClipRect` and `ClipRRect`) with live mode and behavior switching.

## Screenshots
![screenshot 1](https://github.com/user-attachments/assets/920442a3-ab33-40ac-be06-b8a12e7b8a22)
![screenshot 2](https://github.com/user-attachments/assets/ac6996bb-7545-40d1-9444-8fdd6eb78b8e)
![screenshot 3](https://github.com/user-attachments/assets/370d8d69-88e4-4f04-b1e9-b97463cc074f)
![screenshot 4](https://github.com/user-attachments/assets/370d8d69-88e4-4f04-b1e9-b97463cc074f)


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
