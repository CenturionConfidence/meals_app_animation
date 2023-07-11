import 'package:meals_app_animation/data/dummy_data.dart';
import 'package:riverpod/riverpod.dart';

final mealProvider = Provider((ref) {
  return dummyMeals;
});
