import 'package:flutter/material.dart';
import '../types/meal_screen_args.dart';
import '../models/meal.dart' as MealModel;
import '../screens/meal.dart';

class MealItem extends StatelessWidget {
  final MealModel.Meal meal;
  final Function deleteMeal;
  MealItem(this.meal, this.deleteMeal);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // await will finish when the pushed page is poped
        final result = await Navigator.of(context)
            .pushNamed(Meal.routeName, arguments: MealScreenArgs(this.meal.id));
        if (result != null) {
          deleteMeal(result);
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    this.meal.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // stack only widget
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      this.meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      // wrap the long texts
                      softWrap: true,
                      // overflow
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${this.meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(this.meal.complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(this.meal.affordabilityText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
