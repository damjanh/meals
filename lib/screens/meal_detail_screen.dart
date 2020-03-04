import 'package:flutter/material.dart';

import '../dummy_data/original.dart';
import '../model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/category-meals/meal-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal =
        DUMMY_MEALS.where((element) => element.id == id).first;
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: Center(child: Text('Meal Detail: ${selectedMeal.title}')));
  }
}
