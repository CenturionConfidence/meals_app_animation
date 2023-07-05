import 'package:flutter/material.dart';

class Tiles extends StatelessWidget {
  const Tiles(
      {required this.icon,
      required this.label,
      required this.onTap,
      super.key});

  final String label;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      onTap: onTap,
    );
  }
}
