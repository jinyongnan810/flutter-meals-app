import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  final String title;
  Meals(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
