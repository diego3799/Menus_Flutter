import 'package:flutter/material.dart';
import 'package:restaurant_flutter/dummy_data.dart';
import 'package:restaurant_flutter/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((item) => CategoryItem(item.id, item.title, item.color))
          .toList(),
    ));
  }
}
