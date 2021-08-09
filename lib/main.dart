import 'package:flutter/material.dart';
import './models/filters.dart';
import './models/meal.dart' as MealModel;
import './models/dummy_meals.dart';
import './screens/filter.dart';
import './screens/categories.dart';
import './screens/meals.dart';
import './screens/meal.dart';
import './screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FiltersData filtersData = new FiltersData();
  List<MealModel.Meal> availableMeals = DUMMY_MEALS;
  void saveFilters(FiltersData newFilters) {
    setState(() {
      this.filtersData = newFilters;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (this.filtersData.showVegan && !meal.isVegan) {
          return false;
        }
        if (this.filtersData.showVegetarian && !meal.isVegetarian) {
          return false;
        }
        if (this.filtersData.showGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (this.filtersData.showLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: Categories(),
      routes: {
        // initialRoute is default /
        // '/': (ctx) => Categories(),
        '/': (ctx) => TabScreen(),
        Meals.routeName: (ctx) => Meals(availableMeals),
        Meal.routeName: (ctx) => Meal(),
        FilterScreen.routeName: (ctx) => FilterScreen(saveFilters, filtersData)
      },
      // onGenerateRoute: (settings) {
      //   // when the route name does not exist in routes,
      //   // use setteings to decide which page it should render.
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => Categories());
      // },
      onUnknownRoute: (settings) {
        // fallback page
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
    );
  }
}
