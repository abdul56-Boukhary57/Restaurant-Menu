import 'package:flutter/material.dart';
import 'package:test_meals/Screens/meal_screen.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  final List<Meal> availableMeals;

  const CategoryGridItem({
    Key? key,
    required this.category,
    required this.availableMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filteredMeals = availableMeals
            .where((m) => m.categories.contains(category.id))
            .toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => MealScreen(
              title: category.title,
              meals: filteredMeals,
            ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.54),
              category.color.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
