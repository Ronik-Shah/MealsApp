import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailedScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function _toggleFavourite;
  final Function _isMealFavourite;
  MealDetailedScreen(this._toggleFavourite, this._isMealFavourite);

  Widget buildTitleContainer(
      String title, BuildContext context, MediaQueryData mediaQuery) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.02),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildListContainer(MediaQueryData mediaQuery, Widget widget) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(mediaQuery.size.height * 0.01),
      padding: EdgeInsets.all(mediaQuery.size.height * 0.01),
      height: mediaQuery.size.height * 0.25,
      width: mediaQuery.size.width * 1.5,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealID == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQuery.size.height * 0.3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleContainer('Ingredients', context, mediaQuery),
            buildListContainer(
              mediaQuery,
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Theme.of(context).accentColor.withOpacity(0.5),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: mediaQuery.size.height * 0.005,
                        horizontal: mediaQuery.size.width * 0.01),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildTitleContainer('Steps', context, mediaQuery),
            buildListContainer(
              mediaQuery,
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(_isMealFavourite(mealID) ? Icons.star : Icons.star_border),
        onPressed: () => _toggleFavourite(mealID),
      ),
    );
  }
}
