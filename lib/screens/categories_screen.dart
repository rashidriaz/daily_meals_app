import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        GridView(
                padding: const EdgeInsets.all(25),
                children: DUMMY_CATEGORIES
                    .map((categoryData) => CategoryItem(
                    categoryData.id,
                    categoryData.title,
                    categoryData.color,
                    categoryData.imageUrl))
                    .toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                  childAspectRatio: 1.15,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 15,
                ),
              );
  }
}
