import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  void onDrawerItemClicked(BuildContext context, int index) {
    switch(index) {
      case 0:
        Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        break;
      default:
        return;
    }
  }

  Widget _buildDrawerItem(
      {@required BuildContext context,
      @required String title,
      @required IconData icon,
      @required int index}) {
    return ListTile(
      onTap: () {
        onDrawerItemClicked(context, index);
      },
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Meals',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          _buildDrawerItem(
            context: context,
            title: 'Meals',
            icon: Icons.restaurant,
            index: 0,
          ),
          _buildDrawerItem(
            context: context,
            title: 'Filters',
            icon: Icons.settings,
            index: 1,
          ),
        ],
      ),
    );
  }
}
