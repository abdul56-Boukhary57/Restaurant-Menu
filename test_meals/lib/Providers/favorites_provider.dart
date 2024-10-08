import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_meals/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal); //state = _favoritesMeal
    if (isExisting) {
       // state.remove(meal);  can not remove in a state
      state = state.where((element) => element.id != meal.id).toList();
      return false;

    } else {
      // state.add(meal);  can not add in a state
      state = [...state , meal];// [... [1,2,3] , 4];
      return true;

    }
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {    //exposes the
  //stateful widget
  return FavoritesMealsNotifier();
});
