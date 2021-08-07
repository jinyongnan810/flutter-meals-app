import 'package:flutter/material.dart';
import './screens/categories.dart';
import './screens/meals.dart';
import './screens/meal.dart';
import './screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        Meals.routeName: (ctx) => Meals(),
        Meal.routeName: (ctx) => Meal()
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
