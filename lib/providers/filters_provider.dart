import 'package:meals_app_animation/providers/meal_provider.dart';
import 'package:riverpod/riverpod.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
        });

  void setFilters(Filters filters, bool isActive) {
    state = {
      ...state,
      filters: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealProvider = Provider((ref) {
  final filters = ref.watch(filtersProvider);
  final meal = ref.watch(mealProvider);
  return meal.where((meal) {
    if (filters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
