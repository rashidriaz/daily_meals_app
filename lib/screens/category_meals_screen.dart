import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class CategoryMealsScreen extends StatefulWidget{
  static const routeName = "/category-meals";
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  @override
  State createState() {
    return _CategoryMealsScreenState();
  }
}
class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  Color categoryColor;
  bool _loadedInitData = false;
  void removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
   }

   @override
  // ignore: must_call_super
  void initState() {
     super.initState();
  }

  @override
  void didChangeDependencies(){
    if(_loadedInitData)return;
    final routeArguments =
    ModalRoute.of(context).settings.arguments as Map<String, Object>;
    categoryTitle = routeArguments["title"];
    final categoryId = routeArguments["id"];
    categoryColor = routeArguments["color"] as Color;
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Meal meal = displayedMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            color: categoryColor,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
