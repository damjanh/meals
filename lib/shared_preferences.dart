import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import './model/filters.dart';

class SharedPreferencesHelper {
  static const _FILTER_LACTOSE = "filter_lactose";
  static const _FILTER_VEGETARIAN = "filter_vegetarian";
  static const _FILTER_VEGAN = "filter_vegan";
  static const _FILTER_GLUTEN = "filter_gluten";

  static Future<SharedPreferences> get preferences =>
      SharedPreferences.getInstance();

  static Future setFilters(Filters filters) async {
    final prefs = await preferences;
    var futures = List<Future>();
    futures.add(prefs.setBool(_FILTER_LACTOSE, filters.lactose ?? false));
    futures.add(prefs.setBool(_FILTER_VEGETARIAN, filters.vegetarian ?? false));
    futures.add(prefs.setBool(_FILTER_VEGAN, filters.vegan ?? false));
    futures.add(prefs.setBool(_FILTER_GLUTEN, filters.gluten ?? false));

    return Future.wait(futures);
  }

  static Future<Filters> getFilters() async {
    final prefs = await preferences;
    final lactose = prefs.getBool(_FILTER_LACTOSE) ?? false;
    final vegetarian = prefs.getBool(_FILTER_VEGETARIAN) ?? false;
    final vegan = prefs.getBool(_FILTER_VEGAN) ?? false;
    final gluten = prefs.getBool(_FILTER_GLUTEN) ?? false;

    return Filters(
        vegan: vegan, lactose: lactose, gluten: gluten, vegetarian: vegetarian);
  }
}
