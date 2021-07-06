import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
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
    Container(color: Colors.black),
    Container(color: Colors.grey,),
    Container(color: Colors.amber,)
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "1"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "2"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "3"),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
