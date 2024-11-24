import 'package:flutter/material.dart';  
import 'package:meal_application/provider/favourite_meal_provider.dart';
import 'package:meal_application/provider/filters_provider.dart';
import 'package:meal_application/screens/categories.dart';
import 'package:meal_application/screens/filters.dart';
import 'package:meal_application/screens/meals.dart';
import 'package:meal_application/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// In dart there is tradition to declare a Global varible started with k....
const kInitialFilters = { 
  Filter.glutentFree:false,
  Filter.lactosFree:false,
  Filter.vegaterian:false,
  Filter.vegan:false
};

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() {
    return _TabState();
  }
}

class _TabState extends ConsumerState<Tabs> {
  int _selectedPageIndex = 0;
 
  void _onSelectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
       await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const Filters(),
        ),
      );
      //print(result);
     
      
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = Categories(
      availableMeals: availableMeals,
    );

    String appBarTitle = "Categories";

    if (_selectedPageIndex == 1) {
      final favouriteMeal = ref.watch(favouriteMealsProvider);
      activePage = Meals(
        meals: favouriteMeal,
      );
      appBarTitle = "Your Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
      drawer: MainDrawer(
        onSelect: _setScreen,
      ),
    );
  }
}
