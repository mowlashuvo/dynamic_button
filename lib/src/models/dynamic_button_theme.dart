import 'package:flutter/foundation.dart';

import 'dynamic_button_animation.dart';
import 'dynamic_button_behavior.dart';
import 'dynamic_button_style.dart';

/// Defines a reusable theme for [DynamicButton].
///
/// A theme groups together style, animation and behavior
/// so they can be reused across the application.
///
/// Example:
///
/// ```dart
/// final theme = DynamicButtonTheme(
///   style: DynamicButtonStyle.material(),
///   animation: DynamicButtonAnimation.material(),
///   behavior: DynamicButtonBehavior.material(),
/// );
/// ```
@immutable
class DynamicButtonTheme {
  const DynamicButtonTheme({
    this.style = const DynamicButtonStyle(),
    this.animation = const DynamicButtonAnimation(),
    this.behavior = const DynamicButtonBehavior(),
  });

  /// Visual appearance.
  final DynamicButtonStyle style;

  /// Animation configuration.
  final DynamicButtonAnimation animation;

  /// Interaction behavior.
  final DynamicButtonBehavior behavior;

  DynamicButtonTheme copyWith({
    DynamicButtonStyle? style,
    DynamicButtonAnimation? animation,
    DynamicButtonBehavior? behavior,
  }) {
    return DynamicButtonTheme(
      style: style ?? this.style,
      animation: animation ?? this.animation,
      behavior: behavior ?? this.behavior,
    );
  }

  /// Material defaults.
  factory DynamicButtonTheme.material() {
    return DynamicButtonTheme(
      style: DynamicButtonStyle.material(),
      animation: DynamicButtonAnimation.material(),
      behavior: DynamicButtonBehavior.material(),
    );
  }

  /// Cupertino defaults.
  factory DynamicButtonTheme.cupertino() {
    return DynamicButtonTheme(
      style: DynamicButtonStyle.cupertino(),
      animation: DynamicButtonAnimation.cupertino(),
      behavior: DynamicButtonBehavior.cupertino(),
    );
  }
}
