import 'package:flutter/material.dart';
import 'package:meals_app_animation/data/dummy_data.dart';
import 'package:meals_app_animation/models/meal.dart';
import 'package:meals_app_animation/screens/category_screen.dart';
import 'package:meals_app_animation/screens/filters_screen.dart';
import 'package:meals_app_animation/screens/meals_screen.dart';
import 'package:meals_app_animation/widget/main_drawer.dart';

const kinitValues = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];
  Map<Filters, bool> _selectedFilters = kinitValues;

  void infoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteStatus(Meal meal) {
    var isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        infoMessage('Meal Item Removed');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        infoMessage('Meal Item Added');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onselectPage(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentState: _selectedFilters,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kinitValues;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoryScreen(
      onToggle: _toggleFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        title: 'Favorites',
        onToggle: _toggleFavoriteStatus,
      );
      activePageTitle = 'My favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectPage: onselectPage,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
