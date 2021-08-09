import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/main_drawer.dart';
import './categories.dart';
import './favorites.dart';

class TabInfo {
  String title;
  Widget tab;
  TabInfo(this.title, this.tab);
}

class TabScreen extends StatefulWidget {
  List<Meal> favorites;
  TabScreen(this.favorites);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<TabInfo> tabs = [];
  int selectedIndex = 0;
  @override
  void initState() {
    tabs = [
      new TabInfo('Categories', Categories()),
      new TabInfo('Favorites', Favorites(widget.favorites))
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App - ${tabs[selectedIndex].title}'),
      ),
      drawer: MainDrawer(),
      body: tabs[selectedIndex].tab,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white54,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
