import 'package:flutter/material.dart';

/// Defines the visual appearance of [DynamicButton].
///
/// Inspired by Flutter's ButtonStyle but simplified for
/// dynamic selection components.
///
/// Example:
///
/// ```dart
/// DynamicButtonStyle(
///   backgroundColor: Colors.white,
///   selectedBackgroundColor: Colors.blue,
///   borderRadius: BorderRadius.circular(16),
/// )
/// ```
@immutable
class DynamicButtonStyle {
  /// Creates a button style.
  const DynamicButtonStyle({
    this.height,
    this.width,
    this.minWidth,
    this.minHeight,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    this.margin = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.selectedBackgroundColor = Colors.blue,
    this.disabledBackgroundColor = const Color(0xFFE0E0E0),
    this.foregroundColor = Colors.black,
    this.selectedForegroundColor = Colors.white,
    this.disabledForegroundColor = Colors.grey,
    this.gradient,
    this.selectedGradient,
    this.border,
    this.selectedBorder,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.boxShadow,
    this.selectedBoxShadow,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.none,
    this.mouseCursor = SystemMouseCursors.click,
  });

  // ---------------------------------------------------------------------------
  // Size
  // ---------------------------------------------------------------------------

  final double? width;

  final double? height;

  final double? minWidth;

  final double? minHeight;

  // ---------------------------------------------------------------------------
  // Spacing
  // ---------------------------------------------------------------------------

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  // ---------------------------------------------------------------------------
  // Colors
  // ---------------------------------------------------------------------------

  final Color backgroundColor;

  final Color selectedBackgroundColor;

  final Color disabledBackgroundColor;

  final Color foregroundColor;

  final Color selectedForegroundColor;

  final Color disabledForegroundColor;

  // ---------------------------------------------------------------------------
  // Decoration
  // ---------------------------------------------------------------------------

  final Gradient? gradient;

  final Gradient? selectedGradient;

  final Border? border;

  final Border? selectedBorder;

  final BorderRadiusGeometry borderRadius;

  final List<BoxShadow>? boxShadow;

  final List<BoxShadow>? selectedBoxShadow;

  // ---------------------------------------------------------------------------
  // Layout
  // ---------------------------------------------------------------------------

  final AlignmentGeometry alignment;

  final Clip clipBehavior;

  // ---------------------------------------------------------------------------
  // Mouse
  // ---------------------------------------------------------------------------

  final MouseCursor mouseCursor;

  // ---------------------------------------------------------------------------
  // Utilities
  // ---------------------------------------------------------------------------

  DynamicButtonStyle copyWith({
    double? width,
    double? height,
    double? minWidth,
    double? minHeight,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? disabledBackgroundColor,
    Color? foregroundColor,
    Color? selectedForegroundColor,
    Color? disabledForegroundColor,
    Gradient? gradient,
    Gradient? selectedGradient,
    Border? border,
    Border? selectedBorder,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    List<BoxShadow>? selectedBoxShadow,
    AlignmentGeometry? alignment,
    Clip? clipBehavior,
    MouseCursor? mouseCursor,
  }) {
    return DynamicButtonStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      minWidth: minWidth ?? this.minWidth,
      minHeight: minHeight ?? this.minHeight,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      selectedForegroundColor:
          selectedForegroundColor ?? this.selectedForegroundColor,
      disabledForegroundColor:
          disabledForegroundColor ?? this.disabledForegroundColor,
      gradient: gradient ?? this.gradient,
      selectedGradient: selectedGradient ?? this.selectedGradient,
      border: border ?? this.border,
      selectedBorder: selectedBorder ?? this.selectedBorder,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      selectedBoxShadow: selectedBoxShadow ?? this.selectedBoxShadow,
      alignment: alignment ?? this.alignment,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      mouseCursor: mouseCursor ?? this.mouseCursor,
    );
  }

  /// Default Material style.
  factory DynamicButtonStyle.material() {
    return const DynamicButtonStyle();
  }

  /// iOS-inspired segmented style.
  factory DynamicButtonStyle.cupertino() {
    return const DynamicButtonStyle(
      backgroundColor: Color(0xFFF2F2F7),
      selectedBackgroundColor: Colors.white,
      foregroundColor: Colors.black,
      selectedForegroundColor: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }
}
