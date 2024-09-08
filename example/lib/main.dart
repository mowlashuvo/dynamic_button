import 'package:dynamic_button/dynamic_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DynamicButton Example',
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DynamicButton Example'),
      ),
      body: const Center(
        child: DynamicButton(
          list: ['Option 1', 'Option 2', 'Option 3'], // Example data
          selectedColor: Colors.red,
          color: Colors.blueAccent,
          borderColor: Colors.black,
          border: 1,
          radius: 18,
          elevation: 15,
          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
