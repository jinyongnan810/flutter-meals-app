import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';
import '../models/dummy_meals.dart';
import '../types/meals_screen_args.dart';

class Meals extends StatefulWidget {
  static const routeName = '/meals';

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  String categoryTitle = '';
  List<Meal> meals = [];
  void deleteMeal(String id) {
    setState(() {
      meals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  void initState() {
    // the context is not working in initState
    // final args = ModalRoute.of(context)!.settings.arguments as MealsScreenArgs;
    // meals =
    //     DUMMY_MEALS.where((meal) => meal.categories.contains(args.id)).toList();
    // categoryTitle = args.title;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as MealsScreenArgs;
    meals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(args.id)).toList();
    categoryTitle = args.title;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index], this.deleteMeal);
        },
        itemCount: meals.length,
      )),
    );
  }
}
