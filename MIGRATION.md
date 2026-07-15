# Migration Guide

## Migrating from 0.0.7 to 1.0.0

DynamicButton was redesigned with a new generic API.

## Before

```dart
DynamicButton(
  list: [
    "Flutter",
    "Dart",
  ],

  color: Colors.blue,

  selectedColor: Colors.red,

  onTap: (String value) {
    print(value);
  },
);