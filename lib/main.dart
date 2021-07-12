import 'package:flutter/material.dart';
import 'package:flutter_training/components/card2/fooderlich_theme.dart';
import 'package:flutter_training/models/grocery_manager.dart';
import 'package:flutter_training/models/tab_manager.dart';
import 'package:provider/provider.dart';
import 'components/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FooderlichTheme.dark(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager())
        ],
        child: MyHomePage(title: 'HOME',),
      ),
    );
  }
}


