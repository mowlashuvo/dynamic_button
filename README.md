# Dynamic Button

<p align="center">
A production-ready Flutter UI component library for building customizable buttons, chips, segmented controls, filters, and selectable UI components.
</p>

<p align="center">
Supports generic items, custom builders, animations, themes, gradients, shadows, and advanced selection behaviors.
</p>

---

## Features

✨ **Generic Item Support**

- Works with any data type (`String`, `Model`, `Enum`, etc.)
- Fully customizable item rendering using `itemBuilder`

✨ **Selection System**

- Single selection
- Multiple selection
- Programmatic selection using controller

✨ **Modern UI Styles**

- Chip style
- Segmented control style
- Filter buttons
- Custom button groups
- iOS Cupertino inspired controls

✨ **Customization**

- Custom background colors
- Selected colors
- Gradients
- Borders
- Border radius
- Shadows
- Padding
- Text styles
- Icons
- Custom widgets

✨ **Animations**

- Press animation
- Selection animation
- Ripple effects
- Smooth transitions

✨ **Developer Friendly**

- Generic API
- Clean architecture
- Theme support
- Dark mode compatible
- Custom builders

---

# Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  dynamic_button: ^0.1.0
```

Then:

```bash
flutter pub get
```

---

# Basic Usage

```dart
import 'package:dynamic_button/dynamic_button.dart';
```

```dart
DynamicButton<String>(
  items: const [
    "Flutter",
    "Dart",
    "Firebase",
  ],

  onTap: (item, index) {
    debugPrint(
      "Selected: $item",
    );
  },

  itemBuilder: (
    context,
    item,
    index,
    state,
  ) {
    return Text(
      item,
      style: TextStyle(
        color: state.isSelected
            ? Colors.white
            : Colors.black,
      ),
    );
  },
);
```

---

# Chips Style

```dart
DynamicButton<String>(
  items: const [
    "Flutter",
    "Dart",
    "API",
  ],

  behavior: DynamicButtonBehavior(
    selectionMode: SelectionMode.single,
  ),

  style: DynamicButtonStyle(
    backgroundColor: Colors.grey.shade200,
    selectedBackgroundColor: Colors.blue,
    borderRadius: BorderRadius.circular(30),
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
  ),

  itemBuilder: (
    context,
    item,
    index,
    state,
  ) {
    return Text(item);
  },
);
```

---

# Segmented Control

Create iOS style segmented controls.

```dart
DynamicButton<String>(
  items: const [
    "Day",
    "Week",
    "Month",
  ],

  behavior: DynamicButtonBehavior(
    selectionMode: SelectionMode.single,
  ),

  style: DynamicButtonStyle.cupertino(),

  itemBuilder: (
    context,
    item,
    index,
    state,
  ) {
    return Center(
      child: Text(item),
    );
  },
);
```

---

# Multiple Selection Filter

```dart
DynamicButton<String>(
  items: const [
    "Popular",
    "Newest",
    "Trending",
  ],

  behavior: DynamicButtonBehavior(
    selectionMode: SelectionMode.multiple,
  ),

  onTap: (item,index){
    debugPrint(item);
  },

  itemBuilder: (
    context,
    item,
    index,
    state,
  ) {

    return Row(
      children: [

        Icon(
          state.isSelected
              ? Icons.check_circle
              : Icons.circle_outlined,
        ),

        Text(item),

      ],
    );
  },
);
```

---

# Gradient Buttons

```dart
DynamicButton<String>(
  items: const [
    "Buy",
    "Sell",
    "Hold",
  ],

  style: DynamicButtonStyle(
    gradient: LinearGradient(
      colors: [
        Colors.purple,
        Colors.blue,
      ],
    ),

    selectedGradient: LinearGradient(
      colors: [
        Colors.orange,
        Colors.red,
      ],
    ),

    borderRadius:
        BorderRadius.circular(16),
  ),

  itemBuilder: (
    context,
    item,
    index,
    state,
  ) {
    return Text(
      item,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  },
);
```

---

# Generic Model Support

You are not limited to strings.

Example:

```dart
class Category {

  final int id;
  final String name;

  Category(
    this.id,
    this.name,
  );
}
```

Usage:

```dart
DynamicButton<Category>(
  items: categories,

  itemBuilder: (
    context,
    item,
    index,
    state,
  ){

    return Text(
      item.name,
    );

  },
);
```

---

# Controller Support

Control selection manually:

```dart
final controller =
    DynamicButtonController<String>(
      selectionMode:
          SelectionMode.multiple,
    );
```

Use:

```dart
DynamicButton<String>(
  controller: controller,

  items:[
    "One",
    "Two",
    "Three",
  ],
);
```

---

# Supported Layouts

✅ Horizontal  
✅ Vertical  
✅ Wrap layout  
✅ Custom item size

---

# Roadmap

- [x] Generic items
- [x] Custom builder
- [x] Selection controller
- [x] Animations
- [x] Gradient support
- [x] Theme support
- [ ] Drag reorder support
- [ ] Accessibility improvements
- [ ] More Cupertino widgets

---

# License

MIT License

Copyright © 2026 Mowla Shuvo