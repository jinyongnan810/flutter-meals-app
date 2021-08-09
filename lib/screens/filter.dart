import 'package:flutter/material.dart';
import '../components/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool showGlutenFree = false;
  bool showVegan = false;
  bool showVegetarian = false;
  bool showLactoseFree = false;
  Widget buildSwitchItem(String title, String subtitle, bool value,
      void Function(bool) onChanged) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Text('Filter meals'),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchItem('Vegan', 'Only include Vagan meals.', showVegan,
                  (newValue) {
                setState(() {
                  showVegan = newValue;
                });
              }),
              buildSwitchItem('Vegetarian', 'Only include Vegetarian meals.',
                  showVegetarian, (newValue) {
                setState(() {
                  showVegetarian = newValue;
                });
              }),
              buildSwitchItem('Gluten Free', 'Only include Gluten free meals.',
                  showGlutenFree, (newValue) {
                setState(() {
                  showGlutenFree = newValue;
                });
              }),
              buildSwitchItem(
                  'Lactose Free',
                  'Only include Lactose free meals.',
                  showLactoseFree, (newValue) {
                setState(() {
                  showLactoseFree = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
