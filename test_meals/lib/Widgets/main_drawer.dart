import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;

  const MainDrawer({Key? key, required this.onSelectScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.54),
                  Theme.of(context).secondaryHeaderColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 35,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('categories');
            },
            leading: const Icon(Icons.restaurant, size: 22),
            title: Text(
              'Categories',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: const Icon(Icons.settings, size: 22),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          )
        ],
      ),
    );
  }
}
