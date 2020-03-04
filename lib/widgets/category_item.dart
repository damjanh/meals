import 'package:flutter/material.dart';
import 'file:///C:/New2/meals/meals_app/lib/screens/category_meals_screen.dart';

import '../model/category.dart';
import '../utils.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({this.category});

  void _onCategorySelected(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onCategorySelected(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.7), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: darken(
              category.color,
              0.1,
            ),
          ),
        ),
      ),
    );
  }
}
