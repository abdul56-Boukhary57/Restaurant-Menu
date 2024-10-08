import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_meals/data/dummy_data.dart';
import 'package:test_meals/models/meal.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
