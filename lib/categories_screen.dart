import 'package:flutter/material.dart';

import './dummy_data/original.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: <Widget>[
        ...DUMMY_CATEGORIES
            .map((category) => CategoryItem(
                  title: category.title,
                  color: category.color,
                ))
            .toList()
      ],
    );
  }
}
