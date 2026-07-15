import 'package:flutter/foundation.dart';

import '../enums/selection_mode.dart';

/// Controls the selection state of a [DynamicButton].
///
/// The controller allows programmatic selection, clearing,
/// toggling, and listening for selection changes.
///
/// Example:
///
/// ```dart
/// final controller = DynamicButtonController<String>();
///
/// controller.select("Flutter");
///
/// controller.clear();
/// ```
class DynamicButtonController<T> extends ChangeNotifier {
  DynamicButtonController({
    this.selectionMode = SelectionMode.single,
    List<T>? initialSelection,
  }) : _selectedItems = List<T>.from(initialSelection ?? const []);

  /// Selection behavior.
  final SelectionMode selectionMode;

  final List<T> _selectedItems;

  /// Currently selected items.
  List<T> get selectedItems => List.unmodifiable(_selectedItems);

  /// First selected item.
  ///
  /// Returns null if nothing is selected.
  T? get selectedItem => _selectedItems.isEmpty ? null : _selectedItems.first;

  /// Whether anything is selected.
  bool get hasSelection => _selectedItems.isNotEmpty;

  /// Number of selected items.
  int get selectedCount => _selectedItems.length;

  /// Returns true if the given item is selected.
  bool isSelected(T item) {
    return _selectedItems.contains(item);
  }

  /// Select a single item.
  ///
  /// Previous selections will be removed unless
  /// [SelectionMode.multiple] is used.
  void select(T item) {
    switch (selectionMode) {
      case SelectionMode.none:
        return;

      case SelectionMode.single:
      case SelectionMode.requiredSingle:
        _selectedItems
          ..clear()
          ..add(item);
        break;

      case SelectionMode.multiple:
        if (!_selectedItems.contains(item)) {
          _selectedItems.add(item);
        }
        break;
    }

    notifyListeners();
  }

  /// Toggle selection.
  void toggle(T item) {
    switch (selectionMode) {
      case SelectionMode.none:
        return;

      case SelectionMode.single:
        _selectedItems
          ..clear()
          ..add(item);
        break;

      case SelectionMode.requiredSingle:
        if (!_selectedItems.contains(item)) {
          _selectedItems
            ..clear()
            ..add(item);
        }
        break;

      case SelectionMode.multiple:
        if (_selectedItems.contains(item)) {
          _selectedItems.remove(item);
        } else {
          _selectedItems.add(item);
        }
        break;
    }

    notifyListeners();
  }

  /// Remove one selected item.
  void deselect(T item) {
    if (selectionMode == SelectionMode.requiredSingle &&
        _selectedItems.length == 1 &&
        _selectedItems.first == item) {
      return;
    }

    _selectedItems.remove(item);

    notifyListeners();
  }

  /// Replace all selected items.
  void selectAll(Iterable<T> items) {
    if (selectionMode != SelectionMode.multiple) {
      return;
    }

    _selectedItems
      ..clear()
      ..addAll(items);

    notifyListeners();
  }

  /// Clears every selected item.
  void clear() {
    if (selectionMode == SelectionMode.requiredSingle) {
      return;
    }

    _selectedItems.clear();

    notifyListeners();
  }

  /// Replace the current selection.
  void setSelection(List<T> items) {
    switch (selectionMode) {
      case SelectionMode.none:
        return;

      case SelectionMode.single:
      case SelectionMode.requiredSingle:
        _selectedItems.clear();

        if (items.isNotEmpty) {
          _selectedItems.add(items.first);
        }
        break;

      case SelectionMode.multiple:
        _selectedItems
          ..clear()
          ..addAll(items);
        break;
    }

    notifyListeners();
  }
}
