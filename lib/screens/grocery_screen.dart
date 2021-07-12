import 'package:flutter/material.dart';
import 'package:flutter_training/models/grocery_manager.dart';
import 'package:flutter_training/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/models/models.dart';
class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: (){
          //TODO 11: Present GroceryItemScreen
        },
        ),
        body: buildGroceryScreen(),
      );
    }

    Widget buildGroceryScreen(){
      return Consumer<GroceryManager>(
          builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          return Container();
        }
        else {
          return EmptyGroceryScreen();}
      });
    }
}
