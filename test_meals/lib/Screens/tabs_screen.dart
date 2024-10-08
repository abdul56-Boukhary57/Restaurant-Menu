import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_meals/Providers/favorites_provider.dart';
import 'package:test_meals/Providers/nav_bar_provider.dart';

import 'package:test_meals/Screens/categories_screen.dart';
import 'package:test_meals/Screens/meal_screen.dart';
import 'package:test_meals/Widgets/main_drawer.dart';

import '../Providers/filters_provider.dart';
import '../models/meal.dart';
import 'filters_screen.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    final int selectedPageIndex = ref.watch(navBarProvider);

    Widget activePage() {
      if (selectedPageIndex == 1) {
        final List<Meal> favoriteMeal = ref.watch(favoritesMealsProvider);
        return MealScreen(meals: favoriteMeal);
      } else {
        return CategoryScreen(
          availableMeals: availableMeals,
        );
      }
    }

    String getPageTitle() {
      if (selectedPageIndex == 0) {
        return 'Categories';
      } else {
        return 'Favorites';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(getPageTitle()),
      ),
      body: activePage(),
      drawer: MainDrawer(onSelectScreen: (String identifier) {
        Navigator.pop(context);
        if (identifier == 'filters') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const FiltersScreen(),
            ),
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: ref.read(navBarProvider.notifier).selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
