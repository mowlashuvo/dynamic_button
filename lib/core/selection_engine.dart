import '../dynamic_button.dart';

/// Internal selection engine.
///
/// Responsible for all selection logic.
///
/// The widget should never implement selection logic directly.
/// Instead, delegate all operations to this engine.
class SelectionEngine<T> {
  const SelectionEngine({
    required this.controller,
    required this.selectionMode,
  });

  final DynamicButtonController<T> controller;

  final SelectionMode selectionMode;

  /// Returns whether the item is selected.
  bool isSelected(T item) {
    return controller.isSelected(item);
  }

  /// Returns whether the index is selected.
  bool isSelectedAt(
    List<T> items,
    int index,
  ) {
    if (index < 0 || index >= items.length) {
      return false;
    }

    return controller.isSelected(items[index]);
  }

  /// Handles tapping an item.
  void onItemTap(T item) {
    switch (selectionMode) {
      case SelectionMode.none:
        break;

      case SelectionMode.single:
        controller.select(item);
        break;

      case SelectionMode.requiredSingle:
        controller.select(item);
        break;

      case SelectionMode.multiple:
        controller.toggle(item);
        break;
    }
  }

  /// Clears the selection.
  void clear() {
    controller.clear();
  }

  /// Select all items.
  void selectAll(List<T> items) {
    controller.selectAll(items);
  }

  /// Inverts the current selection.
  void invertSelection(List<T> items) {
    if (selectionMode != SelectionMode.multiple) {
      return;
    }

    final selected = controller.selectedItems.toSet();

    final inverted = items.where((item) => !selected.contains(item)).toList();

    controller.setSelection(inverted);
  }

  /// Returns the selected items.
  List<T> get selectedItems => controller.selectedItems;

  /// Returns the first selected item.
  T? get selectedItem => controller.selectedItem;

  /// Whether anything is selected.
  bool get hasSelection => controller.hasSelection;
}
