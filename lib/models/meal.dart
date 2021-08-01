enum Complexity { Simple, Normal, Challenging }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final String title;
  final String image;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  const Meal({
    required this.id,
    required this.title,
    required this.image,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });
  String get complexityText {
    switch (this.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Normal:
        return 'Normal';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (this.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }
}
