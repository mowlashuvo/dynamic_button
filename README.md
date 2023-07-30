## Features

make dynamic button from a list

```dart
class DynamicButtonList extends StatelessWidget {

  DynamicButtonList({super.key});

  List<String> list = ['category1','category2','category3','category4','category5',];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return DynamicButtonView(
              text: list[index],
              index: index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }
}
```
<img src="https://github.com/mowlashuvo/dynamic_button/assets/28320188/085659db-71c0-4d2c-9362-c08bf88cc879" alt="">