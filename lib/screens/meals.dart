import 'package:flutter/material.dart';
import '../types/meals_screen_args.dart';

class Meals extends StatelessWidget {
  static const routeName = '/meals';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MealsScreenArgs;
    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(
        child: Text(args.title),
      ),
    );
  }
}
