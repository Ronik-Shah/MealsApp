import 'package:flutter/material.dart';

import '../Screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: mediaQuery.size.height * 0.12,
            width: double.infinity,
            padding: EdgeInsets.all(mediaQuery.size.height * 0.02),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking UP!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: mediaQuery.textScaleFactor * 30,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
