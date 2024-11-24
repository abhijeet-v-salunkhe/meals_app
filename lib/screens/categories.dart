import 'package:flutter/material.dart';
import 'package:meal_application/data/dummy_data.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/screens/meals.dart';
import 'package:meal_application/widgets/category_grid_item.dart';
import 'package:meal_application/models/category.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Meals(
          title: category.title,
          meals: filteredMeal,
        ),
      ),
    ); //Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2),
          children: [
            // instead of availableCategoried.map((category) => CategoryGridItem(category: category,))
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ],
        ),
        builder: (context, child) => SlideTransition(
              position: Tween(
                begin: const Offset(0, 0.3),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOut,
                ),
              ),
              child: child,
            ));
  }
}
