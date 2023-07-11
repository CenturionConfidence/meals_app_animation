import 'package:flutter/material.dart';
import 'package:meals_app_animation/models/meal.dart';
import 'package:meals_app_animation/screens/meal_detail_screen.dart';
import 'package:meals_app_animation/widget/traits.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(this._meal, { super.key});

  final Meal _meal;


  String get complexityText {
    return _meal.complexity.name[0].toUpperCase() +
        _meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return _meal.affordability.name[0].toUpperCase() +
        _meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MealDetailScreen(

                  meal: _meal,
                ),
          ),
        );
      },
      child: Card(
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Hero(
                tag: _meal.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(_meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        _meal.title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Traits(
                            icon: Icons.schedule,
                            label: '${_meal.duration} min',
                          ),
                          const SizedBox(width: 20),
                          Traits(
                            icon: Icons.work,
                            label: complexityText,
                          ),
                          const SizedBox(width: 20),
                          Traits(
                            icon: Icons.attach_money,
                            label: affordabilityText,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
