import 'package:flutter/material.dart';
import 'package:flutter_training/models/tab_manager.dart';
import 'package:flutter_training/screens/explore_screen.dart';
import 'package:flutter_training/screens/grocery_screen.dart';
import 'package:flutter_training/screens/recipes_screen.dart';
import 'package:provider/provider.dart';
import 'botombar.dart';
import 'homecard/home_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen(),
  ];
  


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Fooder',
            style: Theme.of(context).textTheme.headline6,),
          ),
            body: pages[tabManager.selectedTab],
            bottomNavigationBar: BottomBar(currentIndex: tabManager.selectedTab, tap: (index) => {
              tabManager.goTo(index)
            },)
        );
      },

    );
  }
}