import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favorites;
  Favorites(this.favorites);
  @override
  Widget build(BuildContext context) {
    return this.favorites.isEmpty
        ? Text('No favorites yet.')
        : Container(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(this.favorites[index], () {});
              },
              itemCount: favorites.length,
            ),
          );
  }
}
