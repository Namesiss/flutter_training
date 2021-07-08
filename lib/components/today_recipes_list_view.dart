import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/models/explore_recipe.dart';

import 'card1/card1.dart';
import 'card2/card2.dart';
import 'card3/card3.dart';

class ToDayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;
  const ToDayRecipeListView({Key key, this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Công thức hôm nay', style: Theme.of(context).textTheme.headline1,),
        SizedBox(height: 16,),
        Container(
          height: 400,
          color: Colors.transparent,
          //TODO: ADD LIST VIEW HERE
          child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            final recipe = recipes[index];
            return buildCard(recipe);
          }, separatorBuilder: (context, index){
            return SizedBox(width: 16);
          }, itemCount: recipes.length),
        )
      ],
    ),
    );
  }

  Widget buildCard(ExploreRecipe recipe){
    if(recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    }
    else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
      }
  }
}
