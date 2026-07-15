import 'package:flutter/material.dart';

import '../../core/selection_engine.dart';
import '../controller/dynamic_button_controller.dart';
import '../models/dynamic_button_animation.dart';
import '../models/dynamic_button_behavior.dart';
import '../models/dynamic_button_state.dart';
import '../models/dynamic_button_style.dart';

typedef DynamicButtonItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  int index,
  DynamicButtonState state,
);

typedef DynamicButtonSelectionChanged<T> = void Function(
  List<T> selectedItems,
);

class DynamicButton<T> extends StatefulWidget {
  const DynamicButton({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.controller,
    this.style = const DynamicButtonStyle(),
    this.animation = const DynamicButtonAnimation(),
    this.behavior = const DynamicButtonBehavior(),
    this.onItemPressed,
    this.onSelectionChanged,
  });

  /// Items
  final List<T> items;

  /// Builds each item.
  final DynamicButtonItemBuilder<T> itemBuilder;

  /// Optional external controller.
  final DynamicButtonController<T>? controller;

  /// Visual style.
  final DynamicButtonStyle style;

  /// Animation configuration.
  final DynamicButtonAnimation animation;

  /// Interaction behavior.
  final DynamicButtonBehavior behavior;

  /// Called when an item is tapped.
  final ValueChanged<T>? onItemPressed;

  /// Called whenever selection changes.
  final DynamicButtonSelectionChanged<T>? onSelectionChanged;

  @override
  State<DynamicButton<T>> createState() => _DynamicButtonState<T>();
}

class _DynamicButtonState<T> extends State<DynamicButton<T>> {
  late final DynamicButtonController<T> _controller;

  late final SelectionEngine<T> _selectionEngine;

  bool _ownsController = false;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = DynamicButtonController<T>(
        selectionMode: widget.behavior.selectionMode,
      );

      _ownsController = true;
    } else {
      _controller = widget.controller!;
    }

    _selectionEngine = SelectionEngine(
      controller: _controller,
      selectionMode: widget.behavior.selectionMode,
    );

    _controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);

    if (_ownsController) {
      _controller.dispose();
    }

    super.dispose();
  }

  void _onControllerChanged() {
    widget.onSelectionChanged?.call(
      _controller.selectedItems,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.items.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (context, index) {
        final item = widget.items[index];

        final selected = _selectionEngine.isSelected(item);

        final state = DynamicButtonState(
          index: index,
          isSelected: selected,
          isDisabled: !widget.behavior.enabled,
        );

        return GestureDetector(
          onTap: widget.behavior.enabled
              ? () {
                  _selectionEngine.onItemTap(item);

                  widget.onItemPressed?.call(item);
                }
              : null,
          child: AnimatedContainer(
            duration: widget.animation.duration,
            curve: widget.animation.curve,
            margin: widget.style.margin,
            padding: widget.style.padding,
            alignment: widget.style.alignment,
            constraints: BoxConstraints(
              minWidth: widget.style.minWidth ?? 0,
              minHeight: widget.style.minHeight ?? 0,
            ),
            width: widget.style.width,
            height: widget.style.height,
            decoration: BoxDecoration(
              color: selected
                  ? widget.style.selectedBackgroundColor
                  : widget.style.backgroundColor,
              gradient: selected
                  ? widget.style.selectedGradient
                  : widget.style.gradient,
              border:
                  selected ? widget.style.selectedBorder : widget.style.border,
              borderRadius: widget.style.borderRadius,
              boxShadow: selected
                  ? widget.style.selectedBoxShadow
                  : widget.style.boxShadow,
            ),
            child: widget.itemBuilder(
              context,
              item,
              index,
              state,
            ),
          ),
        );
      },
    );
  }
}
