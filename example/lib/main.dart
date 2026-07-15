import 'package:dynamic_button/dynamic_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DemoPage(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final controller = DynamicButtonController<String>(
    selectionMode: SelectionMode.multiple,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DynamicButton Full Demo"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "1. Chips Style",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: DynamicButton<String>(
                items: const ["Flutter", "Dart", "Firebase", "API"],
                behavior: const DynamicButtonBehavior(
                  selectionMode: SelectionMode.single,
                ),
                style: DynamicButtonStyle(
                  backgroundColor: Colors.grey.shade200,
                  selectedBackgroundColor: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                ),
                itemBuilder: (context, item, index, state) {
                  return Text(
                    item,
                    style: TextStyle(
                      color: state.isSelected ? Colors.white : Colors.black,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "2. Segmented Control",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: DynamicButton<String>(
                items: const ["Day", "Week", "Month"],
                behavior: DynamicButtonBehavior.cupertino(),
                style: DynamicButtonStyle.cupertino(),
                animation: DynamicButtonAnimation.cupertino(),
                itemBuilder: (context, item, index, state) {
                  return Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: state.isSelected ? Colors.black : Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "3. Multi Select Filters",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: DynamicButton<String>(
                controller: controller,
                items: const [
                  "All",
                  "Popular",
                  "Newest",
                  "Trending",
                ],
                behavior: const DynamicButtonBehavior(
                  selectionMode: SelectionMode.multiple,
                ),
                style: DynamicButtonStyle(
                  backgroundColor: Colors.white,
                  selectedBackgroundColor: Colors.green,
                  border: Border.all(color: Colors.green),
                  selectedBorder: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(20),
                ),
                itemBuilder: (context, item, index, state) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        state.isSelected
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        size: 16,
                        color: state.isSelected ? Colors.white : Colors.green,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        item,
                        style: TextStyle(
                          color: state.isSelected ? Colors.white : Colors.green,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "4. Gradient Buttons",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: DynamicButton<String>(
                items: const ["Buy", "Sell", "Hold"],
                behavior: const DynamicButtonBehavior(
                  selectionMode: SelectionMode.single,
                ),
                style: DynamicButtonStyle(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.blue,
                    ],
                  ),
                  selectedGradient: const LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.red,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 4),
                      color: Colors.black26,
                    ),
                  ],
                ),
                itemBuilder: (context, item, index, state) {
                  return const Text(
                    "Action",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "5. Disabled Buttons",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: DynamicButton<String>(
                items: const [
                  "Option A",
                  "Option B",
                  "Option C",
                ],
                behavior: const DynamicButtonBehavior(
                  enabled: false,
                ),
                style: DynamicButtonStyle(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                itemBuilder: (context, item, index, state) {
                  return Text(item);
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "6. Icon + Text",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: DynamicButton<String>(
                items: const [
                  "Home",
                  "Search",
                  "Profile",
                ],
                behavior: const DynamicButtonBehavior(
                  selectionMode: SelectionMode.single,
                ),
                style: DynamicButtonStyle(
                  backgroundColor: Colors.white,
                  selectedBackgroundColor: Colors.black,
                  border: Border.all(color: Colors.black12),
                  selectedBorder: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
                itemBuilder: (context, item, index, state) {
                  final icon = switch (item) {
                    "Home" => Icons.home,
                    "Search" => Icons.search,
                    _ => Icons.person,
                  };

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        size: 18,
                        color: state.isSelected ? Colors.white : Colors.black,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        item,
                        style: TextStyle(
                          color: state.isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
