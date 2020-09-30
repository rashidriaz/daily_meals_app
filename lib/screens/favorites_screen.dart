import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget{

  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("You have no favorites yet - start adding saome!"),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        Meal meal = favoriteMeals[index];
        return MealItem(
          id: meal.id,
          title: meal.title,
          imageUrl: meal.imageUrl,
          duration: meal.duration,
          complexity: meal.complexity,
          affordability: meal.affordability,
          color: Theme.of(context).primaryColor,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}