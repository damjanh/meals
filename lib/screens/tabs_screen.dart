import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';

  final List<String> favorites;

  TabsScreen({this.favorites});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _onPageSelect(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget _buildScreen() {
    switch(_selectedPageIndex) {
      case 0:
        return CategoriesScreen();
      case 1:
        return FavoritesScreen(favorites: widget.favorites);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: _buildScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onPageSelect,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text(
              'Categories',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            title: Text(
              'Favorites',
            ),
          )
        ],
      ),
    );
  }
}
