import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _veganFree = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  Widget buildSwitchListTileItem(
      String data, bool isFree, Function changedState) {
    return SwitchListTile(
      onChanged: changedState,
      value: isFree,
      title: Text(data),
      subtitle: Text('Only includes ${data.toLowerCase()} meals'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _veganFree,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
        title: Text('Filtered Results'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(mediaQuery.size.height * 0.02),
            child: Text(
              'Adjust your meal settings',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTileItem('Gluten-Free', _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                buildSwitchListTileItem('vegan-Free', _veganFree, (value) {
                  setState(() {
                    _veganFree = value;
                  });
                }),
                buildSwitchListTileItem('Vegetarian', _vegetarian, (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                buildSwitchListTileItem('Lactose-Free', _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
