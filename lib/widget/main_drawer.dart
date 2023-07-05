import 'package:flutter/material.dart';
import 'package:meals_app_animation/widget/list_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectPage});

  final void Function(String identifier) onSelectPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  'Cooking Up',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          Tiles(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                onSelectPage('meals');
              }),
          Tiles(
              icon: Icons.settings,
              label: 'Filters',
              onTap: () {
                onSelectPage('filters');
              }),
        ],
      ),
    );
  }
}
