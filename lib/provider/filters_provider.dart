import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_application/provider/meals_provider.dart';

enum Filter {
  glutentFree,
  lactosFree,
  vegaterian,
  vegan;
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutentFree: false,
          Filter.lactosFree: false,
          Filter.vegaterian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter,bool> choosenFilter){
    state = choosenFilter;
  }
  void setFilter(Filter filter, bool isActive) {
    //state[filter] = isActive; It ! allowed it will mutated
    state = {...state, filter: isActive}; 
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier());

final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal){
      if(activeFilters[Filter.glutentFree]! && !meal.isGlutenFree){
        return false;
      }
      if(activeFilters[Filter.lactosFree]! && !meal.isLactoseFree){
        return false;
      }
      if(activeFilters[Filter.vegaterian]! && !meal.isVegetarian){
        return false;
      }
      if(activeFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
});