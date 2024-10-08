import 'package:flutter/material.dart';
import 'package:test_meals/Screens/meal_detail_screen.dart';
import 'package:test_meals/Widgets/meal_item.dart';
import '../models/meal.dart';

class MealScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;

  const MealScreen({
    Key? key,
    this.title,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(title: Text(title!)),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map(
              (meal) => MealItem(
                meal: meal,
                onSelectedMeal: (Meal meal) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => MealDetailSc(
                        meal: meal,
                      ),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
