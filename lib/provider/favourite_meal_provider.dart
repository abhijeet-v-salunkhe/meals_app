import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_application/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier(): super([]);

  bool toggleFavouriteMeals(Meal meal){
    final mealIsFavourite = state.contains(meal);

    if(mealIsFavourite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else{
      state = [...state,meal];
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier,List<Meal>>((ref){
  return FavouriteMealsNotifier();
});