# Dynamic Button

`dynamic_button` is a customizable button widget for Flutter that allows you to create dynamic and
interactive buttons with various design and behavior options. This widget supports dynamic lists,
customizable borders, colors, text styles, and selectable states using checkboxes.

### Features

- **Customizable Background Color**: Set the button's background color with the color property.
- **Adjustable Border**: Define border color and width using borderColor and border properties.
- **Rounded Corners**: Customize the border radius to achieve rounded corners with the radius property.
- **Elevation**: Apply elevation to give the button a raised effect with the elevation property.
- **Flexible Height**: Specify the height for the button using the height property.
- **Dynamic List of Buttons**: Generate a horizontal list of buttons based on the provided list of strings via the list property.
- **Selectable Buttons**: Integrate checkboxes into the buttons to allow selection.
- **Custom Text Style**: Use the titleStyle property to define the font size, weight, and color of the button labels.


```dart

import 'package:flutter/material.dart';
import 'package:dynamic_button/dynamic_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('DynamicButton Example')),
        body: Center(
          child: DynamicButton(
            list: ['Option 1', 'Option 2', 'Option 3'],
            color: Colors.blue,
            borderColor: Colors.blueAccent,
            border: 2,
            radius: 12,
            elevation: 5,
            height: 50,
            labelStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            onTap: (String label) {
              // Handle button tap with button label
              print('Tapped button: $label');
            },
          ),
        ),
      ),
    );
  }
}