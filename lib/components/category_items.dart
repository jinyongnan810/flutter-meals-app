import 'package:flutter/material.dart';
import '../screens/meals.dart';
import '../types/meals_screen_args.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  CategoryItem(this.title, this.color);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(Meals.routeName, arguments: MealsScreenArgs(title));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [this.color.withOpacity(0.7), this.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
