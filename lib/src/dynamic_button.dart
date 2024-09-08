import 'package:flutter/material.dart';

/// A dynamic button widget that displays a horizontal list of buttons.
///
/// Each button can be customized in terms of height, color, border,
/// radius, elevation, and label style. The button selection state is managed internally.
class DynamicButton extends StatefulWidget {
  /// The height of the button.
  ///
  /// Defaults to 40.
  final double height;

  /// The list of strings that will be displayed as the label of each button.
  ///
  /// This is a required parameter.
  final List<String> list;

  /// The background color of the button.
  ///
  /// Defaults to [Colors.white].
  final Color color;

  /// The color of the button's border.
  ///
  /// Defaults to [Colors.white].
  final Color borderColor;

  /// The width of the button's border.
  ///
  /// Defaults to 0, indicating no border.
  final double border;

  /// The radius of the button's corners.
  ///
  /// Defaults to 0, indicating no rounded corners.
  final double radius;

  /// The elevation of the button.
  ///
  /// Controls the shadow depth of the button.
  /// Defaults to 0, indicating no shadow.
  final double elevation;

  /// The style of the button's label text.
  ///
  /// Defaults to [TextStyle] with a font size of 14.
  final TextStyle? labelStyle;

  /// The color of the button when it is selected.
  ///
  /// Defaults to [Colors.blueAccent].
  final Color? selectedColor;

  /// Whether to display a checkbox inside the button.
  ///
  /// Defaults to `true`.
  final bool isCheckbox;

  /// The color of the check inside the checkbox.
  ///
  /// Defaults to [Colors.white].
  final Color checkboxCheckColor;

  /// The color of the checkbox when it is active (selected).
  ///
  /// Defaults to [Colors.blue].
  final Color checkboxActiveColor;

  /// The color of the checkbox border.
  ///
  /// Defaults to [Colors.white].
  final Color checkboxBorderColor;

  /// Creates a [DynamicButton] widget with customizable options.
  ///
  /// The [list] parameter is required as it contains the labels for the buttons.
  const DynamicButton({
    super.key,
    required this.list,
    this.height = 40,
    this.color = Colors.white,
    this.borderColor = Colors.white,
    this.border = 0,
    this.radius = 0,
    this.elevation = 0,
    this.labelStyle,
    this.selectedColor,
    this.isCheckbox = true,
    this.checkboxCheckColor = Colors.white,
    this.checkboxActiveColor = Colors.blue,
    this.checkboxBorderColor = Colors.white,
  });

  @override
  State<DynamicButton> createState() => _DynamicButtonState();
}

class _DynamicButtonState extends State<DynamicButton> {
  // Tracks the index of the selected button.
  int _selectedIndex = 0;
  Color? buttonColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (widget.selectedColor != null) {
            buttonColor =
                _selectedIndex == index ? widget.selectedColor : widget.color;
          }
          return Card(
            margin: EdgeInsets.zero,
            elevation: widget.elevation,
            color: buttonColor ?? widget.color,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: widget.borderColor, width: widget.border),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              child: Container(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.isCheckbox)
                      Checkbox(
                        checkColor: widget.checkboxCheckColor,
                        activeColor: widget.checkboxActiveColor,
                        side: BorderSide(
                          color: widget.checkboxBorderColor, // Use the custom border color
                          width: 2.0,
                        ),
                        value: _selectedIndex == index,
                        onChanged: (value) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    Text(widget.list[index], style: widget.labelStyle),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: widget.list.length,
      ),
    );
  }
}
