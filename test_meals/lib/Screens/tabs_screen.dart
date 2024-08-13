import 'package:flutter/material.dart';
import 'package:test_meals/Screens/categories_screen.dart';
import 'package:test_meals/Screens/meal_screen.dart';
import 'package:test_meals/Widgets/main_drawer.dart';
import 'package:test_meals/data/dummy_data.dart';

import '../models/meal.dart';
import 'filters_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

const Map<Filter, bool> kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favoritesMeal = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;
  int currentIndex = 0;

  void _showInfoMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoritesMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favoritesMeal.remove(meal);
      });
      _showInfoMessage('Meal was removed successfully');
    } else {
      setState(() {
        _favoritesMeal.add(meal);
      });
      _showInfoMessage('Meal was added successfully');
    }
  }

  void _setScreen(String identifier) {
    Navigator.pop(context);
    if (identifier == 'filters') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters),
        ),
      ).then((value) => setState(
            () => _selectedFilters = value ?? kInitialFilters,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList(); // no filter yet
    Widget activePage() {
      if (currentIndex == 1) {
        return MealScreen(
            meals: _favoritesMeal, onToggleFavorite: _toggleMealFavoriteStatus);
      } else {
        return CategoryScreen(
            availableMeals: availableMeals,
            onToggleFavorite: _toggleMealFavoriteStatus);
      }
    }

    String getPageTitle() {
      if (currentIndex == 0) {
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
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
