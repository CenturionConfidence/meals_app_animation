import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile(
      {required this.label,
      required this.onlabel,
      required this.value,
      required this.onSelected,
      super.key});

  final String label;
  final String onlabel;
  final bool value;
  final void Function(bool value) onSelected;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onSelected,
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        onlabel,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
