import 'package:flutter/material.dart';
import '../models/filters.dart';
import '../components/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  void Function(FiltersData) saveFilters;
  FiltersData filters;

  FilterScreen(this.saveFilters, this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  FiltersData filters = new FiltersData();

  Widget buildSwitchItem(String title, String subtitle, bool value,
      void Function(bool) onChanged) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged);
  }

  @override
  void initState() {
    filters = widget.filters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilters(filters);
                Navigator.of(context).pushReplacementNamed('/');
              })
        ],
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
              buildSwitchItem(
                  'Vegan', 'Only include Vagan meals.', this.filters.showVegan,
                  (newValue) {
                setState(() {
                  this.filters.showVegan = newValue;
                });
              }),
              buildSwitchItem('Vegetarian', 'Only include Vegetarian meals.',
                  this.filters.showVegetarian, (newValue) {
                setState(() {
                  this.filters.showVegetarian = newValue;
                });
              }),
              buildSwitchItem('Gluten Free', 'Only include Gluten free meals.',
                  this.filters.showGlutenFree, (newValue) {
                setState(() {
                  this.filters.showGlutenFree = newValue;
                });
              }),
              buildSwitchItem(
                  'Lactose Free',
                  'Only include Lactose free meals.',
                  this.filters.showLactoseFree, (newValue) {
                setState(() {
                  this.filters.showLactoseFree = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
