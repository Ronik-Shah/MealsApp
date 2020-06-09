import 'package:flutter/material.dart';
import '../Widgets/category_item.dart';
import '../dummy_data.dart';

class CatagoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.02),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: mediaQuery.size.width * 0.5,
          childAspectRatio: mediaQuery.size.aspectRatio * 3,
          crossAxisSpacing: mediaQuery.size.width * 0.03,
          mainAxisSpacing: mediaQuery.size.height * 0.03,
        ),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  title: catData.title,
                  color: catData.color,
                  id: catData.id,
                ))
            .toList(),
      ),
    );
  }
}
