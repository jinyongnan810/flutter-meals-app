import 'package:flutter/material.dart';
import '../components/category_items.dart';
import '../models/dummy_categories.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
            children: [
              ...DUMMY_CATEGORIES
                  .map((e) => CategoryItem(e.id, e.title, e.color))
            ],
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 240,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20)));
  }
}
