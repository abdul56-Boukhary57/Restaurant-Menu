import 'package:flutter/material.dart';
import 'package:test_meals/Widgets/category_grid_item.dart';
import 'package:test_meals/data/dummy_data.dart';

import '../models/meal.dart';

class CategoryScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  final void Function(Meal meal) onToggleFavorite;

  const CategoryScreen({Key? key, required this.availableMeals, required this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category, availableMeals: availableMeals, onToggleFavorite: onToggleFavorite,)
        ],
      ),
    );
  }
}
