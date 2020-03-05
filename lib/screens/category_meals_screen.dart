import 'package:flutter/material.dart';

import '../dummy_data/original.dart';
import '../model/category.dart';
import '../model/filters.dart';
import '../model/meal.dart';
import '../widgets/meal-item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final Filters filters;

  CategoryMealsScreen({this.filters});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category _category;
  List<Meal> _displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      _category = ModalRoute.of(context).settings.arguments as Category;
      _displayedMeals = DUMMY_MEALS
          .where((element) => element.categories.contains(_category.id))
          .toList();
      _loadedInitData = true;
    }
    final filter = widget.filters;
    _displayedMeals.removeWhere((element) =>
        (filter.gluten && !element.isGlutenFree) ||
        (filter.vegan && !element.isVegan) ||
        (filter.vegetarian && !element.isVegetarian) ||
        (filter.lactose && !element.isLactoseFree));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = _displayedMeals[index];
          return MealItem(
            id: item.id,
            title: item.title,
            imageUrl: item.imageUrl,
            duration: item.duration,
            complexity: item.complexity,
            affordability: item.affordability,
          );
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}
