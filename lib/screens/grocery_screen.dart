import 'package:flutter/material.dart';
import 'package:flutter_training/constraints.dart';
import 'package:flutter_training/models/grocery_manager.dart';
import 'package:flutter_training/screens/empty_grocery_screen.dart';
import 'package:flutter_training/screens/grocery_item_screen.dart';
import 'package:flutter_training/screens/grocery_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/models/models.dart';
class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        onPressed: (){
          //TODO 11: Present GroceryItemScreen
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.push(context, MaterialPageRoute(builder: (context) => GroceryItemScreen(
            onCreate: (item) {
              manager.addItem(item);
              Navigator.pop(context);
            },
          )));
        },
        ),
        body: buildGroceryScreen(),
      );
    }

    Widget buildGroceryScreen(){
      return Consumer<GroceryManager>(
          builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          //TODO 25: Add GroceryListScreen
          return GroceryListScreen(manager: manager,);
        }
        else {
          return EmptyGroceryScreen();}
      });
    }


}
