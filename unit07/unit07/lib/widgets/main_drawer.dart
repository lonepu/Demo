import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  // Function for ListTile Style
  const MainDrawer({super.key});

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
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            //contrainer Design for Drawer
            color: Theme.of(context).colorScheme.secondary,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child:
                //text adding for drawer title
                Text(
                  'Cooking Up!',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
          ),
          SizedBox(height: 20),
          // addig Drawer list for buildListTile
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
