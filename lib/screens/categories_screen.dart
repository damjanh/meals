import 'package:flutter/material.dart';

import '../dummy_data/original.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: <Widget>[
        ...DUMMY_CATEGORIES
            .map((category) => CategoryItem(category: category))
            .toList()
      ],
    );
  }
}
