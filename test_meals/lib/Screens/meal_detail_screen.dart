import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailSc extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  const MealDetailSc(
      {Key? key, required this.meal, required this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
        actions: [IconButton(onPressed: ()=>onToggleFavorite(meal), icon: const Icon(Icons.star))],
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
              Text(step, style: const TextStyle(fontSize: 22, height: 1.5) , textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
