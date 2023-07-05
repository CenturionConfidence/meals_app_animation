import 'package:flutter/material.dart';
import 'package:meals_app_animation/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {required this.onToggle, required this.meal, super.key});

  final Meal meal;
  final void Function(Meal meal) onToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggle(meal);
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.imageUrl,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 20),
            for (final ingredient in meal.ingredients) Text(ingredient),
            const SizedBox(height: 30),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 20),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
