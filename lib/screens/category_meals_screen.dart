import 'package:flutter/material.dart';

import '../dummy_data/original.dart';
import '../model/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final filteredMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(category.id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(filteredMeals[index].title);
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
