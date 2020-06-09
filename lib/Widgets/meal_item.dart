import 'package:flutter/material.dart';

import '../Screen/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Easy-Pesy';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailedScreen.routeName, arguments: id)
        .then((result) {
      // if (result != null) removeItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: mediaQuery.size.height * 0.3,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: mediaQuery.size.width * 0.8,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                        vertical: mediaQuery.size.height * 0.008,
                        horizontal: mediaQuery.size.width * 0.002),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: mediaQuery.textScaleFactor * 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(mediaQuery.size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: mediaQuery.size.width * 0.006,
                      ),
                      Text(
                        '$duration min',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.assignment),
                      SizedBox(
                        width: mediaQuery.size.width * 0.006,
                      ),
                      Text(
                        complexityText,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: mediaQuery.size.width * 0.006,
                      ),
                      Text(
                        affordabilityText,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
