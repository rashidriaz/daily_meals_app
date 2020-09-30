import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailScreen(this.toggleFavorite, this.isFavorite);
  Widget buildSectionTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      // ignore: deprecated_member_use
      child: Text(
        "Ingredients:",
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mealId = routeArguments["id"] as String;
    final Color color = routeArguments["color"];
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) {
                    List items = selectedMeal.ingredients[index].split("_");
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(items[0]),
                            radius: 25,
                            backgroundColor: Theme.of(context).accentColor,
                            foregroundColor: Colors.white,
                          ),
                          title: Text(items[1]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                )),
            buildSectionTitle("Steps", context),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("#${(index + 1)}"),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId)? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
