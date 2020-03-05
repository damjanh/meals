import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildFilterItem(
      {@required BuildContext context,
      @required String title,
      @required String subtitle,
      @required bool value,
      @required Function onChanged}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust displayed meals',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _buildFilterItem(
                      context: context,
                      title: 'Gluten Free',
                      subtitle: 'Exclude non gluten free meals.',
                      value: _glutenFree,
                      onChanged: (bool newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      },
                    ),
                    _buildFilterItem(
                      context: context,
                      title: 'Vegetarian',
                      subtitle: 'Exclude non vegetarian meals.',
                      value: _vegetarian,
                      onChanged: (bool newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      },
                    ),
                    _buildFilterItem(
                      context: context,
                      title: 'Vegan',
                      subtitle: 'Exclude non vegan meals.',
                      value: _vegan,
                      onChanged: (bool newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      },
                    ),
                    _buildFilterItem(
                      context: context,
                      title: 'Lactose Free',
                      subtitle: 'Exclude non lactose free meals.',
                      value: _lactoseFree,
                      onChanged: (bool newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
