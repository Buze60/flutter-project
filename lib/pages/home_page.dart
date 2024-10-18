// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pro/component/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  UI
//_________________________________________________________________________
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      body: Container(),
      appBar: AppBar(
        title: const Text('H O M E'),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
