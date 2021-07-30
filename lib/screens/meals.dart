import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/dummy_meals.dart';
import '../types/meals_screen_args.dart';

class Meals extends StatelessWidget {
  static const routeName = '/meals';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MealsScreenArgs;
    final meals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(args.id)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index]);
        },
        itemCount: meals.length,
      )),
    );
  }
}
