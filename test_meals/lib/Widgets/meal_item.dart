import 'package:flutter/material.dart';
import '';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  const MealItem({Key? key, required this.meal, required this.onSelectedMeal})
      : super(key: key);

  String get complexityTest {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
    }
  }

  String get affordabilityTest {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
        onTap: () => onSelectedMeal(meal),
        borderRadius: BorderRadius.circular(20),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(meal.imageUrl),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 30,
                    child: Container(
                      width: 260,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black87),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          meal.title,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 8),
                        Text('${meal.duration} min'),
                      ],
                    ),
                     Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(width: 8),
                        Text(complexityTest),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.price_change),
                        const SizedBox(width: 8),
                        Text(affordabilityTest),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
