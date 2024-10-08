import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_meals/Providers/favorites_provider.dart';

import '../models/meal.dart';

class MealDetailSc extends ConsumerWidget {
  final Meal meal;

  const MealDetailSc({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favoriteMeals = ref.watch(favoritesMealsProvider);
    final bool isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
        actions: [
          IconButton(
            onPressed: () {
              final bool wasAdded = ref
                  .read(favoritesMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? 'Meal was added successfully'
                      : 'Meal was removed successfully'),
                ),
              );
            },
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(meal.imageUrl, fit: BoxFit.cover),
            const SizedBox(height: 8),
            const Text('Ingredients:',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline)),
            const SizedBox(height: 10),
            for (final ingred in meal.ingredients)
              Text(ingred, style: const TextStyle(fontSize: 22, height: 1.5)),
            const SizedBox(height: 10),
            const Text('Steps:',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline)),
            const SizedBox(height: 10),
            for (final step in meal.steps)
              Text(step,
                  style: const TextStyle(fontSize: 22, height: 1.5),
                  textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
