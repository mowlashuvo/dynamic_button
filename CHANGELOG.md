# Changelog

All notable changes to this project will be documented in this file.

## 1.0.0

### 🚀 Breaking Changes

- Replaced `list` parameter with generic `items`.
- Changed API from `DynamicButton` simple widget to generic `DynamicButton<T>`.
- Replaced individual styling parameters with `DynamicButtonStyle`.
- Replaced fixed UI rendering with customizable `itemBuilder`.
- Changed callback signature:
    - Old:
      ```dart
      onTap(String item)
      ```

    - New:
      ```dart
      onTap(T item, int index)
      ```

### ✨ New Features

- Added generic item support.
- Added custom widget rendering.
- Added selection controller.
- Added single selection mode.
- Added multiple selection mode.
- Added segmented control support.
- Added chip/filter style support.
- Added gradient backgrounds.
- Added border customization.
- Added shadow support.
- Added animation configuration.
- Added theme support.
- Added dark mode compatibility.

### 🏗 Architecture

- Introduced scalable package structure.
- Added separated models, controllers, components, and enums.
- Improved API documentation.
- Improved example application.

## 0.0.7

- Previous simple button implementation.