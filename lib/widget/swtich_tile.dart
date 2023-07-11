import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile(
      {required this.label,
      required this.onlabel,
      required this.value,
      required this.onSwitch,
      super.key});

  final String label;
  final String onlabel;
  final bool value;
  final void Function(bool value) onSwitch;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onSwitch,
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
