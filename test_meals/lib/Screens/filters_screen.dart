import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_meals/Providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
        children: [
          customSwitch(
            context,  // Pass context here
            'Gluten-free',
            'Only include gluten-free meals',
            activeFilters[Filter.glutenFree]!,
                (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
          ),
          customSwitch(
            context,  // Pass context here
            'Lactose-free',
            'Only include lactose-free meals',
            activeFilters[Filter.lactoseFree]!,
                (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
          ),
          customSwitch(
            context,  // Pass context here
            'Vegan',
            'Only include Vegan meals',
            activeFilters[Filter.vegan]!,
                (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, value);
            },
          ),
          customSwitch(
            context,  // Pass context here
            'Vegetarian',
            'Only include vegetarian meals',
            activeFilters[Filter.vegetarian]!,
                (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
      BuildContext context,  // Accept context here
      String title,
      String subtitle,
      bool filter,
      Function(bool newValue) onChanged,
      ) =>
      SwitchListTile(
        value: filter,
        onChanged: onChanged,
        activeColor: Theme.of(context).colorScheme.tertiary,  // Use context here
        contentPadding: const EdgeInsets.only(left: 28, right: 32),
        title: Text(title),
        subtitle: Text(subtitle),
      );
}
