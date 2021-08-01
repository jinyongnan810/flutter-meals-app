import 'package:flutter/material.dart';
import '../types/meal_screen_args.dart';
import '../models/dummy_meals.dart';

class Meal extends StatelessWidget {
  static const routeName = '/meal';
  final meals = DUMMY_MEALS;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MealScreenArgs;
    final mealsSelected =
        meals.where((element) => element.id == args.id).toList();
    if (mealsSelected.length == 0) {
      return Container(
        child: Text('Not Found.'),
      );
    }
    final meal = mealsSelected[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Image.network(meal.image),
      ),
    );
  }
}
