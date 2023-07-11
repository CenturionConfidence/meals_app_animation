import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_animation/providers/filters_provider.dart';
import 'package:meals_app_animation/widget/swtich_tile.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          SwitchTile(
            label: 'Gluten Free',
            onlabel: 'Only gluten-free meals',
            value: activeFilters[Filters.glutenFree]!,
            onSwitch: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filters.glutenFree, value);
            },
          ),
          SwitchTile(
            label: 'Lactose Free',
            onlabel: 'Only lactose-free meals',
            value: activeFilters[Filters.lactoseFree]!,
            onSwitch: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filters.lactoseFree, value);
            },
          ),
          SwitchTile(
            label: 'Vegetarian',
            onlabel: 'Only vegetarian meals',
            value: activeFilters[Filters.vegetarian]!,
            onSwitch: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filters.vegetarian, value);
            },
          ),
          SwitchTile(
            label: 'Vegan',
            onlabel: 'Only vegan meals',
            value: activeFilters[Filters.vegan]!,
            onSwitch: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filters.vegan, value);
            },
          )
        ],
      ),
    );
  }
}
