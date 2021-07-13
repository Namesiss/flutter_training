import 'package:flutter/material.dart';
import 'package:flutter_training/models/grocery_manager.dart';
import 'package:flutter_training/screens/grocery_item_screen.dart';
import 'package:flutter_training/screens/grocery_tile.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({Key key, this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO 26: Replace with ListView
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index){
            final item = manager.groceryItems[index];
            //TODO 28: Wrap in Dissmissable
            //TODO 27: Wrap in an InkWell
            
            return Dismissible(
              key: Key(item.id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction){
                manager.deleteItem(index);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                  '${item.name} deleted'
                )));
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete_forever, color: Colors.white, size: 50,),
              ),
              child: InkWell(
                child: GroceryTitle(
                  key: Key(item.id),
                  item: item,
                  onComplete: (change) {
                    manager.completeItem(index, change);
                  },
                ),

                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => GroceryItemScreen(
                    originalItem: item,
                    onUpdate: (item) {
                      manager.updateItem(item, index);
                      Navigator.pop(context);
                    },
                  ))
                  );
                },
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 16.0,),
          itemCount: manager.groceryItems.length),
    );
  }
}
