# Bali Bliss Weddings — Flutter App

High-fashion editorial Flutter app for Bali Bliss Weddings. Runs on **iOS**, **Android**, and **iPad** from a single codebase.

## Design System

Directly mirrors the web platform design:

| Element | Web | Flutter |
|---|---|---|
| Display font | Canela / Playfair Display | Playfair Display (Google Fonts) |
| Sans font | Montserrat | Montserrat (Google Fonts) |
| Accent | Raleway, Great Vibes | Raleway, Great Vibes (Google Fonts) |
| Brand Black | `#171717` | `BaliBlissColors.editorialBlack` |
| Brand Gold | `#C9A84C` | `BaliBlissColors.editorialGold` |
| Brand Cream | `#F5F0EA` | `BaliBlissColors.editorialCream` |

## Screens

- **Splash** — Animated brand reveal with gold orbs and script typography
- **Home/Discover** — Parallax hero, category grid, real weddings, planning tools
- **Vendors** — Searchable directory with category filters and animated cards
- **BlissBook** — Wedding planning workbook: checklist, budget, guest list, tools grid
- **Gallery** — Masonry grid of real wedding collections with filter chips
- **Profile** — Account dashboard with stats and menu
- **Login** — Elegant auth screen with glass-morphism card

## Animations

- `flutter_animate` — staggered entrance, fade, slide, scale
- Parallax hero scaling on scroll
- Animated progress bar
- Spring-style tab indicator
- Animated category filters
- Card press feedback

## API

Connected to `https://baliblissweddings.com/api` (same backend as web platform).

## Setup

### Prerequisites
- Flutter SDK 3.2+
- Xcode (for iOS)
- Android Studio (for Android)

### Install & Run

```bash
flutter pub get
flutter run
```

### Build

```bash
# iOS
flutter build ios

# Android
flutter build apk

# iPad
flutter build ipa
```

## Project Structure

```
lib/
├── main.dart               # Entry point
├── app.dart                # Router + app shell
├── theme/
│   ├── colors.dart         # Brand colors + gradients
│   ├── typography.dart     # Font styles
│   └── theme.dart          # Material theme
├── screens/
│   ├── splash/             # Animated splash
│   ├── home/               # Discover screen
│   ├── vendors/            # Vendor directory
│   ├── blissbook/          # Planning workbook
│   ├── gallery/            # Wedding gallery
│   ├── profile/            # User profile
│   └── auth/               # Login screen
├── widgets/
│   ├── animated_bottom_nav.dart
│   ├── glass_card.dart     # Glassmorphism card + GoldButton
│   └── glass_card.dart     # Section header
├── services/
│   └── api_service.dart    # Dio HTTP client
└── models/
    └── models.dart         # Data models
```

## Connected Repos

- **Web platform**: `TougfGunner/Bali-Bliss-Weddings`
- **Expo app**: `TougfGunner/bali-bliss-mobile`
- **This Flutter app**: `TougfGunner/bali-bliss-ios`
