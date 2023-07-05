import 'package:flutter/material.dart';
import 'package:meals_app_animation/widget/swtich_tile.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}


class FiltersScreen extends StatefulWidget {
  const FiltersScreen({required this.currentState, super.key});

  final Map<Filters, bool> currentState;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluten = false;
  var _lactose = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    _gluten = widget.currentState[Filters.glutenFree]!;
    _lactose = widget.currentState[Filters.lactoseFree]!;
    _vegetarian = widget.currentState[Filters.vegetarian]!;
    _vegan = widget.currentState[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree: _gluten,
            Filters.lactoseFree: _lactose,
            Filters.vegetarian: _vegetarian,
            Filters.vegan: _vegan,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchTile(
              label: 'Gluten Free',
              onlabel: 'Only gluten-free meals',
              value: _gluten,
              onSelected: (value) {
                setState(() {
                  _gluten = value;
                });
              },
            ),
            SwitchTile(
              label: 'Lactose Free',
              onlabel: 'Only lactose-free meals',
              value: _lactose,
              onSelected: (value) {
                setState(() {
                  _lactose = value;
                });
              },
            ),
            SwitchTile(
              label: 'Vegetarian',
              onlabel: 'Only vegetarian meals',
              value: _vegetarian,
              onSelected: (value) {
                setState(() {
                  _vegetarian = value;
                });
              },
            ),
            SwitchTile(
              label: 'Vegan',
              onlabel: 'Only vegan meals',
              value: _vegan,
              onSelected: (value) {
                setState(() {
                  _vegan = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
