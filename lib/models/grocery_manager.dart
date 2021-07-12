import 'package:flutter/cupertino.dart';
import 'package:flutter_training/models/grocery_item.dart';

class GroceryManager extends ChangeNotifier{
  final _groceryItems = <GroceryItem>[];

  // Provides a public getter method for
  // groceryItems, which is unmodifiable!
  // External entities can’t modify the list of
  // grocery items, only read it.
  List<GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);

  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void updateItem(GroceryItem item, int index){
    _groceryItems[index] = item;
    notifyListeners();
  }

  void addItem(GroceryItem item){
    _groceryItems.add(item);
    notifyListeners();
  }

  void completeItem(int index, bool change){
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}