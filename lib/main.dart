import 'package:flutter/material.dart';
import 'package:flutter_training/components/homecard/botombar.dart';
import 'package:flutter_training/components/homecard/homescreen.dart';
import 'package:flutter_training/components/card2/fooderlich_theme.dart';
import 'package:flutter_training/components/card3/card3.dart';
import 'package:flutter_training/screens/explore_screen.dart';
import 'components/card2/card2.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Homescreen(),
    ExploreScreen(),
    Card2(),
    Card3(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomBar(currentIndex: _selectedIndex,tap: _onItemTapped,)
    );
  }
}
