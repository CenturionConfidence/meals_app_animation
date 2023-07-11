import 'package:flutter/material.dart';
import 'package:meals_app_animation/data/dummy_data.dart';
import 'package:meals_app_animation/models/category.dart';
import 'package:meals_app_animation/models/meal.dart';
import 'package:meals_app_animation/screens/meals_screen.dart';
import 'package:meals_app_animation/widget/grid_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.availableMeals, super.key});

  final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      upperBound: 1,
      lowerBound: 0,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectScreen(BuildContext context, Category category) {
    var filteredMeals = widget.availableMeals
        .where(
          (meals) => meals.categories.contains(category.id),
        )
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(_animationController),
        child: child,
      ),
    );
  }
}
