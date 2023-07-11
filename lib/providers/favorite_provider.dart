import 'package:meals_app_animation/models/meal.dart';
import 'package:riverpod/riverpod.dart';

class FavoriteNotifier extends StateNotifier<List<Meal>> {
  FavoriteNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Meal>>(
  (ref) => FavoriteNotifier(),
);
