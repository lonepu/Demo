import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  // const FiltersScreen({super.key});
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(child: Container(child: Text('Filters'))),
    );
  }
}
