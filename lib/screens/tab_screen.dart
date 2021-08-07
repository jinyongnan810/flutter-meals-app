import 'package:flutter/material.dart';
import './categories.dart';
import './favorites.dart';

class TabInfo {
  String title;
  Widget tab;
  TabInfo(this.title, this.tab);
}

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<TabInfo> tabs = [
    new TabInfo('Categories', Categories()),
    new TabInfo('Favorites', Favorites())
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App - ${tabs[selectedIndex].title}'),
      ),
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
