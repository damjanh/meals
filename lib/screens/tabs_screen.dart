import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            indicatorWeight: 4,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.category),
                    SizedBox(width: 4),
                    Text('Categories'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star),
                      SizedBox(width: 4),
                      Text('Favorites'),
                    ]),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
