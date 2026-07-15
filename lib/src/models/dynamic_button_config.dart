import 'package:flutter/foundation.dart';

import '../../dynamic_button.dart';

/// Immutable configuration used internally by DynamicButton.
///
/// Unlike [DynamicButtonTheme], this object is intended to
/// represent the final resolved configuration after merging
/// defaults, theme values, and widget overrides.
@immutable
class DynamicButtonConfig {
  const DynamicButtonConfig({
    required this.style,
    required this.animation,
    required this.behavior,
  });

  /// Visual appearance.
  final DynamicButtonStyle style;

  /// Animation configuration.
  final DynamicButtonAnimation animation;

  /// Interaction behavior.
  final DynamicButtonBehavior behavior;

  DynamicButtonConfig copyWith({
    DynamicButtonStyle? style,
    DynamicButtonAnimation? animation,
    DynamicButtonBehavior? behavior,
  }) {
    return DynamicButtonConfig(
      style: style ?? this.style,
      animation: animation ?? this.animation,
      behavior: behavior ?? this.behavior,
    );
  }

  factory DynamicButtonConfig.fromTheme(
    DynamicButtonTheme theme,
  ) {
    return DynamicButtonConfig(
      style: theme.style,
      animation: theme.animation,
      behavior: theme.behavior,
    );
  }
}
