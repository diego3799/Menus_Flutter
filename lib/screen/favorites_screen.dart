import 'package:flutter/material.dart';
import 'package:restaurant_flutter/models/meal.dart';
import 'package:restaurant_flutter/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  @override
  FavoritesScreen(this._favoriteMeals);
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(child: Text("Add favorites"));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
              id: _favoriteMeals[i].id,
              title: _favoriteMeals[i].title,
              imageUrl: _favoriteMeals[i].imageUrl,
              affordability: _favoriteMeals[i].affordability,
              complexity: _favoriteMeals[i].complexity,
              duration: _favoriteMeals[i].duration);
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
