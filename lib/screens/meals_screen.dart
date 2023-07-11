import 'package:flutter/material.dart';
import 'package:meals_app_animation/models/meal.dart';
import 'package:meals_app_animation/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.meals, required this.title, super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
          meals[index],
        ),
      ),
    );
  }
}
