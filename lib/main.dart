import 'package:flutter/material.dart';

import './model/filters.dart';
import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters;
  List<String> _favorites = [];

  @override
  void initState() {
    SharedPreferencesHelper.getFilters().then((value) {
      setState(() {
        _filters = value;
      });
    });
    SharedPreferencesHelper.getFavorites().then((value) {
      setState(() {
        _favorites = value;
      });
    });
    super.initState();
  }

  void _setFilters(Filters filters) {
    SharedPreferencesHelper.setFilters(filters);
    setState(() {
      _filters = filters;
    });
  }

  void _toggleFavorite(String id) {
    final favorites = _favorites;
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    SharedPreferencesHelper.setFavorites(favorites);
    setState(() {
      _favorites = favorites;
    });
  }

  bool _isMealFavorite(String id) {
    return _favorites.contains(id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blueAccent,
          canvasColor: Color.fromARGB(255, 250, 250, 250),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(favorites: _favorites),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(filters: _filters),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isMealFavorite: _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filters: _filters, onSaveFilters: _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => TabsScreen());
      },
    );
  }
}
