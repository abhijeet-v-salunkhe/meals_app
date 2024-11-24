import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_application/provider/filters_provider.dart';

class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutentFree]!,
            onChanged: (isChecked) {
             ref.read(filtersProvider.notifier).setFilter(Filter.glutentFree, isChecked);
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only Gluten-free is filtered",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactosFree]!,
            onChanged: (isChecked) {
             ref.read(filtersProvider.notifier).setFilter(Filter.lactosFree, isChecked);
            },
            title: Text(
              "Lactos-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only Lacto-free is filtered",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegaterian]!,
            onChanged: (isChecked) {
             ref.read(filtersProvider.notifier).setFilter(Filter.vegaterian, isChecked);
            },
            title: Text(
              "Vegaterian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only Vegaterian is filtered",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
             ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only Vegan is filtered",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 22),
          ),
        ],
      ),
      // drawer: MainDrawer(onSelect: (identifer) {
      //   Navigator.of(context).pop();
      //   if (identifer == "Meal") {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => Tabs(),
      //       ),
      //     );
      //   }
      // }),
    );
  }
}
