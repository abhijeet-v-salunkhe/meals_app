import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelect});
  final void Function(String identifier) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 35,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Meal",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
            ),
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onTap: () {
              onSelect("Meal");
            },
          ),
          ListTile(
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
            ),
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onTap: () {
              onSelect("Filters");
            },
          ),
        ],
      ),
    );
  }
}
