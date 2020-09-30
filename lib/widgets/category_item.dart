import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  final String imageUrl;

  const CategoryItem(this.id, this.title, this.color, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    void selectCategory(BuildContext context) {
      Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
          arguments: {
            "id": id,
            "title": title,
            "color": color,
            "imageUrl": imageUrl
          });
    }

    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Card(
          elevation: 10,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
