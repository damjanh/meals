import 'package:flutter/material.dart';

import '../dummy_data/original.dart';
import '../model/meal.dart';
import '../widgets/meal-item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favorites;

  FavoritesScreen({this.favorites});

  @override
  Widget build(BuildContext context) {
    List<Meal> favoriteMeals = [];
    favorites.forEach((favoriteId) {
      favoriteMeals
          .add(DUMMY_MEALS.where((element) => element.id == favoriteId).first);
    });
    return Container(
      child: Center(
        child: favorites.isEmpty
            ? Text('You havent added any favorites.')
            : ListView.builder(
                itemBuilder: (context, index) {
                  final item = favoriteMeals[index];
                  return MealItem(
                    id: item.id,
                    title: item.title,
                    imageUrl: item.imageUrl,
                    duration: item.duration,
                    complexity: item.complexity,
                    affordability: item.affordability,
                  );
                },
                itemCount: favoriteMeals.length),
      ),
    );
  }
}
