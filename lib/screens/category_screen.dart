import 'package:flutter/material.dart';
import 'package:meals_app_animation/data/dummy_data.dart';
import 'package:meals_app_animation/models/category.dart';
import 'package:meals_app_animation/models/meal.dart';
import 'package:meals_app_animation/screens/meals_screen.dart';
import 'package:meals_app_animation/widget/grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {required this.availableMeals, required this.onToggle, super.key});

  final void Function(Meal meal) onToggle;
  final List<Meal> availableMeals;

  void selectScreen(BuildContext context, Category category) {
    var filteredMeals = availableMeals
        .where(
          (meals) => meals.categories.contains(category.id),
        )
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          onToggle: onToggle,
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      children: [
        for (final category in availableCategories)
          GridItem(
            category: category,
            onToggle: () {
              selectScreen(context, category);
            },
          )
      ],
    );
  }
}
