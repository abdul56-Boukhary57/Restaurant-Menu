import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.currentFilters})
      : super(key: key);
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilter = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilter = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: WillPopScope(
          child: Column(
            children: [
              customSwitch(
                'Gluten-free',
                'Only include gluten-free meals',
                _glutenFreeFilter,
                (bool value) {
                  setState(
                    () {
                      _glutenFreeFilter = value;
                    },
                  );
                },
              ),
              customSwitch(
                'Lactose-free',
                'Only include lactose-free meals',
                _lactoseFreeFilter,
                    (bool value) {
                  setState(
                        () {
                      _lactoseFreeFilter = value;
                    },
                  );
                },
              ),
              customSwitch(
                'Vegan',
                'Only include Vegan meals',
                _veganFilter,
                    (bool value) {
                  setState(
                        () {
                      _veganFilter = value;
                    },
                  );
                },
              ),
              customSwitch(
                'Vegetarian',
                'Only include gluten-free meals',
                _vegetarianFilter,
                    (bool value) {
                  setState(
                        () {
                      _vegetarianFilter = value;
                    },
                  );
                },
              ),
            ],
          ),
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilter,
              Filter.lactoseFree: _lactoseFreeFilter,
              Filter.vegan: _veganFilter,
              Filter.vegetarian: _vegetarianFilter,
            });
            return false;
          }),
    );
  }

  SwitchListTile customSwitch(String title, String subtitle, bool filter,
          Function(bool newValue) onChanged) =>
      SwitchListTile(
        value: filter,
        onChanged: onChanged,
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 28, right: 32),
        title: Text(title),
        subtitle: Text(subtitle),
      );
}
