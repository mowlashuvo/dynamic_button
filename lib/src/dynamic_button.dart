import 'package:flutter/material.dart';

enum DynamicButtonMode {
  single,
  multiple,
}

class DynamicButton<T> extends StatefulWidget {
  /// Generic items list
  final List<T> items;

  /// How to display each item (IMPORTANT FOR GENERIC SUPPORT)
  final Widget Function(
    BuildContext context,
    T item,
    bool selected,
    int index,
  ) itemBuilder;

  final double height;

  final Color color;
  final Color borderColor;
  final double border;
  final double radius;
  final double elevation;

  final Color selectedColor;

  final DynamicButtonMode mode;

  final bool showCheckbox;

  final Color checkboxCheckColor;
  final Color checkboxActiveColor;
  final Color checkboxBorderColor;

  final void Function(T item, int index) onTap;

  const DynamicButton({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onTap,
    this.height = 40,
    this.color = Colors.white,
    this.borderColor = Colors.white,
    this.border = 0,
    this.radius = 0,
    this.elevation = 0,
    this.selectedColor = Colors.blue,
    this.mode = DynamicButtonMode.single,
    this.showCheckbox = true,
    this.checkboxCheckColor = Colors.white,
    this.checkboxActiveColor = Colors.blue,
    this.checkboxBorderColor = Colors.white,
  });

  @override
  State<DynamicButton<T>> createState() => _DynamicButtonState<T>();
}

class _DynamicButtonState<T> extends State<DynamicButton<T>> {
  int _selectedIndex = 0;

  final Set<int> _selectedIndexes = {};

  bool _isSelected(int index) {
    if (widget.mode == DynamicButtonMode.single) {
      return _selectedIndex == index;
    } else {
      return _selectedIndexes.contains(index);
    }
  }

  void _handleTap(int index) {
    setState(() {
      if (widget.mode == DynamicButtonMode.single) {
        _selectedIndex = index;
      } else {
        if (_selectedIndexes.contains(index)) {
          _selectedIndexes.remove(index);
        } else {
          _selectedIndexes.add(index);
        }
      }
    });

    widget.onTap(widget.items[index], index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final selected = _isSelected(index);

          return Card(
            margin: EdgeInsets.zero,
            elevation: widget.elevation,
            color: selected ? widget.selectedColor : widget.color,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: widget.borderColor,
                width: widget.border,
              ),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(widget.radius),
              onTap: () => _handleTap(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.showCheckbox)
                      Checkbox(
                        value: selected,
                        checkColor: widget.checkboxCheckColor,
                        activeColor: widget.checkboxActiveColor,
                        side: BorderSide(
                          color: widget.checkboxBorderColor,
                          width: 2,
                        ),
                        onChanged: (_) => _handleTap(index),
                      ),
                    widget.itemBuilder(
                      context,
                      item,
                      selected,
                      index,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
