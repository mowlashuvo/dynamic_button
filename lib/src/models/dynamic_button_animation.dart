import 'package:flutter/material.dart';

import '../enums/animation_type.dart';

/// Defines all animations used by [DynamicButton].
///
/// This object centralizes animation configuration for:
/// - Selection changes
/// - Press effects
/// - Hover effects
/// - Focus transitions
/// - Indicator movement
///
/// Example:
///
/// ```dart
/// DynamicButtonAnimation(
///   duration: Duration(milliseconds: 250),
///   curve: Curves.easeInOut,
///   pressScale: 0.96,
/// )
/// ```
@immutable
class DynamicButtonAnimation {
  const DynamicButtonAnimation({
    this.enabled = true,

    // Main animation
    this.type = AnimationType.scaleFade,
    this.duration = const Duration(milliseconds: 200),
    this.reverseDuration,
    this.curve = Curves.easeInOut,
    this.reverseCurve,

    // Press
    this.pressScale = 0.96,

    // Hover
    this.hoverScale = 1.02,

    // Opacity
    this.selectedOpacity = 1.0,
    this.unselectedOpacity = 1.0,
    this.disabledOpacity = 0.5,

    // Indicator
    this.indicatorDuration = const Duration(milliseconds: 250),
    this.indicatorCurve = Curves.easeInOut,
  });

  // ---------------------------------------------------------------------------
  // Enable / Disable
  // ---------------------------------------------------------------------------

  /// Enables all built-in animations.
  final bool enabled;

  // ---------------------------------------------------------------------------
  // Main animation
  // ---------------------------------------------------------------------------

  /// Built-in animation preset.
  final AnimationType type;

  /// Duration of implicit animations.
  final Duration duration;

  /// Reverse duration.
  final Duration? reverseDuration;

  /// Forward animation curve.
  final Curve curve;

  /// Reverse animation curve.
  final Curve? reverseCurve;

  // ---------------------------------------------------------------------------
  // Press
  // ---------------------------------------------------------------------------

  /// Scale while pressing.
  ///
  /// Default: 0.96
  final double pressScale;

  // ---------------------------------------------------------------------------
  // Hover
  // ---------------------------------------------------------------------------

  /// Scale while hovering.
  ///
  /// Web/Desktop only.
  final double hoverScale;

  // ---------------------------------------------------------------------------
  // Opacity
  // ---------------------------------------------------------------------------

  /// Opacity for selected item.
  final double selectedOpacity;

  /// Opacity for unselected item.
  final double unselectedOpacity;

  /// Opacity for disabled item.
  final double disabledOpacity;

  // ---------------------------------------------------------------------------
  // Indicator
  // ---------------------------------------------------------------------------

  /// Duration of segmented indicator movement.
  final Duration indicatorDuration;

  /// Curve used by indicator animation.
  final Curve indicatorCurve;

  // ---------------------------------------------------------------------------
  // Utilities
  // ---------------------------------------------------------------------------

  DynamicButtonAnimation copyWith({
    bool? enabled,
    AnimationType? type,
    Duration? duration,
    Duration? reverseDuration,
    Curve? curve,
    Curve? reverseCurve,
    double? pressScale,
    double? hoverScale,
    double? selectedOpacity,
    double? unselectedOpacity,
    double? disabledOpacity,
    Duration? indicatorDuration,
    Curve? indicatorCurve,
  }) {
    return DynamicButtonAnimation(
      enabled: enabled ?? this.enabled,
      type: type ?? this.type,
      duration: duration ?? this.duration,
      reverseDuration: reverseDuration ?? this.reverseDuration,
      curve: curve ?? this.curve,
      reverseCurve: reverseCurve ?? this.reverseCurve,
      pressScale: pressScale ?? this.pressScale,
      hoverScale: hoverScale ?? this.hoverScale,
      selectedOpacity: selectedOpacity ?? this.selectedOpacity,
      unselectedOpacity: unselectedOpacity ?? this.unselectedOpacity,
      disabledOpacity: disabledOpacity ?? this.disabledOpacity,
      indicatorDuration: indicatorDuration ?? this.indicatorDuration,
      indicatorCurve: indicatorCurve ?? this.indicatorCurve,
    );
  }

  /// Disables all built-in animations.
  factory DynamicButtonAnimation.none() {
    return const DynamicButtonAnimation(
      enabled: false,
      type: AnimationType.none,
      duration: Duration.zero,
      indicatorDuration: Duration.zero,
    );
  }

  /// Material-style animation preset.
  factory DynamicButtonAnimation.material() {
    return const DynamicButtonAnimation(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      pressScale: 0.96,
    );
  }

  /// Cupertino-style animation preset.
  factory DynamicButtonAnimation.cupertino() {
    return const DynamicButtonAnimation(
      duration: Duration(milliseconds: 180),
      curve: Curves.easeOut,
      pressScale: 0.98,
      indicatorDuration: Duration(milliseconds: 180),
    );
  }
}
