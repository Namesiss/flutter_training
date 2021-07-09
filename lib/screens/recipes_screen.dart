import 'package:flutter/material.dart';
import 'package:flutter_training/api/mock_fooderlich_service.dart';
import 'package:flutter_training/components/recipes_grid_view.dart';

class RecipesScreen extends StatelessWidget {
  final exploreRecipes = MockFooderlichService();
  RecipesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: exploreRecipes.getRecipes(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        //TODO: Add Recipes
        return RecipesGridView(recipes: snapshot.data,);
      }
      else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
    );
  }
}
