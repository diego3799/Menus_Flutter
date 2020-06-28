import 'package:flutter/material.dart';
import 'package:restaurant_flutter/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false,
      _vegetarians = false,
      _vegan = false,
      _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];

    _lactoseFree = widget.currentFilters['lactose'];

    _vegan = widget.currentFilters['vegan'];

    _vegetarians = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarians,
                };
                widget.saveFilters(_filters);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchTile(
                    'Gluten Free', 'See only Gluten Free', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchTile(
                    'Lactose Free', 'See only Lactose Free', _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchTile(
                    'Vegetarian', 'See only Vegetarian', _vegetarians,
                    (newValue) {
                  setState(() {
                    _vegetarians = newValue;
                  });
                }),
                buildSwitchTile('Vegan', 'See only Vegan', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
