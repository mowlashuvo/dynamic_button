/// Defines how items can be selected.
///
/// Used by [DynamicButton].
///
/// Example:
///
/// ```dart
/// DynamicButton<String>(
///   selectionMode: SelectionMode.single,
/// )
/// ```
enum SelectionMode {
  /// No selection is allowed.
  ///
  /// Tapping an item only triggers callbacks.
  none,

  /// Only one item can be selected.
  ///
  /// Selecting another item automatically deselects
  /// the previous selection.
  single,

  /// Multiple items can be selected.
  ///
  /// Each item toggles independently.
  multiple,

  /// One item must always remain selected.
  ///
  /// The currently selected item cannot be deselected
  /// unless another item is selected first.
  requiredSingle,
}
