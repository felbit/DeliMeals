import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings';

  final Map<String, bool> filters;
  final Function saveSettings;

  SettingsScreen(this.filters, this.saveSettings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.filters['glutenFree'];
    _lactoseFree = widget.filters['lactoseFree'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile({
    String title,
    bool value,
    String subTitle = "",
    Function updateHandler,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subTitle),
      onChanged: updateHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveSettings({
              'glutenFree': _glutenFree,
              'lactoseFree': _lactoseFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan,
            }),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your leal selection:",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  title: 'Gluten-free',
                  subTitle: 'Include only gluten-free food.',
                  value: _glutenFree,
                  updateHandler: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Lactose-free',
                  subTitle: 'Include only lactose-free food.',
                  value: _lactoseFree,
                  updateHandler: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  subTitle: 'Include only meat-free food.',
                  value: _vegetarian,
                  updateHandler: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegan',
                  subTitle: 'Include only vegan food.',
                  value: _vegan,
                  updateHandler: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
