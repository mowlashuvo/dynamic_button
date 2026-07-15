import 'package:flutter/foundation.dart';

import '../enums/button_layout.dart';
import '../enums/selection_mode.dart';

/// Defines how [DynamicButton] behaves.
///
/// This class contains interaction and layout behavior,
/// while visual appearance belongs in [DynamicButtonStyle]
/// and animations belong in [DynamicButtonAnimation].
///
/// Example:
///
/// ```dart
/// DynamicButtonBehavior(
///   selectionMode: SelectionMode.multiple,
///   layout: ButtonLayout.wrap,
/// )
/// ```
@immutable
class DynamicButtonBehavior {
  const DynamicButtonBehavior({
    this.layout = ButtonLayout.horizontal,
    this.selectionMode = SelectionMode.single,
    this.enabled = true,
    this.allowDeselection = true,
    this.closeOnSelect = false,
    this.scrollable = true,
    this.reverse = false,
    this.wrapSpacing = 8,
    this.wrapRunSpacing = 8,
    this.gridCrossAxisCount = 2,
    this.gridChildAspectRatio = 2.5,
    this.enableFeedback = true,
    this.enableRipple = true,
    this.enableHover = true,
    this.enableFocus = true,
    this.enableKeyboardNavigation = true,
  });

  //--------------------------------------------------------------------------
  // Layout
  //--------------------------------------------------------------------------

  /// Layout type.
  final ButtonLayout layout;

  /// Whether the list is scrollable.
  final bool scrollable;

  /// Reverse scroll direction.
  final bool reverse;

  //--------------------------------------------------------------------------
  // Selection
  //--------------------------------------------------------------------------

  /// Selection mode.
  final SelectionMode selectionMode;

  /// Allow deselecting the selected item.
  final bool allowDeselection;

  /// Close popup/dialog after selecting.
  ///
  /// Useful when used inside custom popup menus.
  final bool closeOnSelect;

  //--------------------------------------------------------------------------
  // Grid
  //--------------------------------------------------------------------------

  final int gridCrossAxisCount;

  final double gridChildAspectRatio;

  //--------------------------------------------------------------------------
  // Wrap
  //--------------------------------------------------------------------------

  final double wrapSpacing;

  final double wrapRunSpacing;

  //--------------------------------------------------------------------------
  // Interaction
  //--------------------------------------------------------------------------

  final bool enabled;

  final bool enableRipple;

  final bool enableHover;

  final bool enableFocus;

  final bool enableKeyboardNavigation;

  final bool enableFeedback;

  //--------------------------------------------------------------------------

  DynamicButtonBehavior copyWith({
    ButtonLayout? layout,
    bool? scrollable,
    bool? reverse,
    SelectionMode? selectionMode,
    bool? allowDeselection,
    bool? closeOnSelect,
    int? gridCrossAxisCount,
    double? gridChildAspectRatio,
    double? wrapSpacing,
    double? wrapRunSpacing,
    bool? enabled,
    bool? enableRipple,
    bool? enableHover,
    bool? enableFocus,
    bool? enableKeyboardNavigation,
    bool? enableFeedback,
  }) {
    return DynamicButtonBehavior(
      layout: layout ?? this.layout,
      scrollable: scrollable ?? this.scrollable,
      reverse: reverse ?? this.reverse,
      selectionMode: selectionMode ?? this.selectionMode,
      allowDeselection: allowDeselection ?? this.allowDeselection,
      closeOnSelect: closeOnSelect ?? this.closeOnSelect,
      gridCrossAxisCount: gridCrossAxisCount ?? this.gridCrossAxisCount,
      gridChildAspectRatio: gridChildAspectRatio ?? this.gridChildAspectRatio,
      wrapSpacing: wrapSpacing ?? this.wrapSpacing,
      wrapRunSpacing: wrapRunSpacing ?? this.wrapRunSpacing,
      enabled: enabled ?? this.enabled,
      enableRipple: enableRipple ?? this.enableRipple,
      enableHover: enableHover ?? this.enableHover,
      enableFocus: enableFocus ?? this.enableFocus,
      enableKeyboardNavigation:
          enableKeyboardNavigation ?? this.enableKeyboardNavigation,
      enableFeedback: enableFeedback ?? this.enableFeedback,
    );
  }

  /// Material default behavior.
  factory DynamicButtonBehavior.material() {
    return const DynamicButtonBehavior();
  }

  /// Cupertino segmented behavior.
  factory DynamicButtonBehavior.cupertino() {
    return const DynamicButtonBehavior(
      layout: ButtonLayout.segmented,
      selectionMode: SelectionMode.requiredSingle,
      allowDeselection: false,
      enableRipple: false,
    );
  }
}
