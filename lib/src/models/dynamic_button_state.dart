import 'package:flutter/foundation.dart';

/// Represents the current visual and interaction state of a button.
///
/// This object is passed to the [itemBuilder] so developers can
/// build completely custom UIs.
///
/// Example:
///
/// ```dart
/// itemBuilder: (context, item, index, state) {
///   return AnimatedContainer(
///     duration: const Duration(milliseconds: 200),
///     decoration: BoxDecoration(
///       color: state.isSelected
///           ? Colors.blue
///           : Colors.white,
///     ),
///     child: Text(item.name),
///   );
/// }
/// ```
@immutable
class DynamicButtonState {
  /// Whether this item is currently selected.
  final bool isSelected;

  /// Whether the mouse pointer is hovering over this item.
  ///
  /// Supported on Flutter Web and Desktop.
  final bool isHovered;

  /// Whether this item is currently being pressed.
  final bool isPressed;

  /// Whether this item currently has keyboard focus.
  final bool isFocused;

  /// Whether this item is disabled.
  final bool isDisabled;

  /// Whether the pointer is inside this widget.
  ///
  /// Useful for custom hover effects.
  final bool isPointerInside;

  /// Index of this item.
  final int index;

  const DynamicButtonState({
    required this.index,
    this.isSelected = false,
    this.isHovered = false,
    this.isPressed = false,
    this.isFocused = false,
    this.isDisabled = false,
    this.isPointerInside = false,
  });

  /// Returns true when the item can receive interaction.
  bool get isInteractive => !isDisabled;

  /// Creates a copy with updated values.
  DynamicButtonState copyWith({
    bool? isSelected,
    bool? isHovered,
    bool? isPressed,
    bool? isFocused,
    bool? isDisabled,
    bool? isPointerInside,
    int? index,
  }) {
    return DynamicButtonState(
      index: index ?? this.index,
      isSelected: isSelected ?? this.isSelected,
      isHovered: isHovered ?? this.isHovered,
      isPressed: isPressed ?? this.isPressed,
      isFocused: isFocused ?? this.isFocused,
      isDisabled: isDisabled ?? this.isDisabled,
      isPointerInside: isPointerInside ?? this.isPointerInside,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DynamicButtonState &&
            runtimeType == other.runtimeType &&
            index == other.index &&
            isSelected == other.isSelected &&
            isHovered == other.isHovered &&
            isPressed == other.isPressed &&
            isFocused == other.isFocused &&
            isDisabled == other.isDisabled &&
            isPointerInside == other.isPointerInside;
  }

  @override
  int get hashCode => Object.hash(
        index,
        isSelected,
        isHovered,
        isPressed,
        isFocused,
        isDisabled,
        isPointerInside,
      );

  @override
  String toString() {
    return '''
DynamicButtonState(
  index: $index,
  selected: $isSelected,
  hovered: $isHovered,
  pressed: $isPressed,
  focused: $isFocused,
  disabled: $isDisabled,
  pointerInside: $isPointerInside,
)
''';
  }
}
