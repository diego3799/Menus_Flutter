import 'package:flutter/material.dart';
import 'package:restaurant_flutter/models/meal.dart';
import 'package:restaurant_flutter/screen/categories_screen.dart';
import 'package:restaurant_flutter/screen/favorites_screen.dart';
import 'package:restaurant_flutter/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorite;
  TabsScreen(this.favorite);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favorite), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int number) {
    setState(() {
      _selectedPageIndex = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text('Categories')),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                title: Text('Favorites'))
          ]),
    );
  }
}
