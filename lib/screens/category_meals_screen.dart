import 'package:flutter/material.dart';

import '../dummy_data/original.dart';
import '../model/category.dart';
import '../model/meal.dart';
import '../widgets/meal-item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

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
      _category = ModalRoute
          .of(context)
          .settings
          .arguments as Category;
      _displayedMeals = DUMMY_MEALS
          .where((element) => element.categories.contains(_category.id))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      _displayedMeals.removeWhere((element) => element.id == id);
    });
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
            removeItem: _removeMeal,
          );
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}
