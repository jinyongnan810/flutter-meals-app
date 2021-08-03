import 'package:flutter/material.dart';
import '../types/meal_screen_args.dart';
import '../models/dummy_meals.dart';

class Meal extends StatelessWidget {
  static const routeName = '/meal';
  final meals = DUMMY_MEALS;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MealScreenArgs;
    final meal = meals.firstWhere((element) => element.id == args.id);
    Widget buildSectionTitle(BuildContext context, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildList(BuildContext context, Widget child) {
      return Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    meal.image,
                    fit: BoxFit.cover,
                  )),
              buildSectionTitle(context, 'Ingredients'),
              buildList(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                    ),
                    itemCount: meal.ingredients.length,
                  )),
              buildSectionTitle(context, 'Steps'),
              buildList(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider()
                      ],
                    ),
                    itemCount: meal.steps.length,
                  )),
            ],
          ),
        ));
  }
}
