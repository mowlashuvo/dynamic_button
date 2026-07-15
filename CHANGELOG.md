# Changelog

All notable changes to this project will be documented in this file.

## 1.0.1

### Fixed

- Updated package metadata for pub.dev publishing.
- Improved package compatibility and validation.
- Updated documentation and examples.

---

## 1.0.0

### Breaking Changes

- Replaced the `list` parameter with generic `items` support.
- Changed `DynamicButton` from a string-based widget to a fully generic `DynamicButton<T>` component.
- Replaced individual styling properties with `DynamicButtonStyle`.
- Replaced default label rendering with customizable `itemBuilder`.
- Updated the callback signature.

Before:

```dart
onTap(String item)
```

After:

```dart
onTap(T item, int index)
```

### Added

- Added support for any item type (`String`, model objects, enums, etc.).
- Added custom item rendering with `itemBuilder`.
- Added `DynamicButtonController` for programmatic control.
- Added single selection mode.
- Added multiple selection mode.
- Added segmented control style.
- Added chip/filter style.
- Added gradient backgrounds.
- Added custom borders and radius.
- Added shadow customization.
- Added animation configuration.
- Added theme customization.
- Added dark mode compatibility.

### Improved

- Redesigned package architecture for scalability.
- Separated components, controllers, models, and enums.
- Improved API documentation.
- Improved example application.
- Improved customization capabilities.

### Migration

Users upgrading from `0.0.7` should migrate to the new generic API.

See `MIGRATION.md` for upgrade instructions.

---

## 0.0.7

### Fixed

- Fixed dependency source issue for `dynamic_button`.

### Initial Release

- Added customizable dynamic button widget.
- Added color, border, radius, elevation, and text customization.
- Added selectable button support.