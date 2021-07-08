import 'package:flutter/material.dart';
import 'package:flutter_training/components/card2/fooderlich_theme.dart';
import 'package:flutter_training/models/explore_recipe.dart';

class Card1 extends StatelessWidget {
  final ExploreRecipe recipe;
  const Card1({Key key, this.recipe}) : super(key: key);

  final String category = 'Editor`s Choice';
  final String title = 'The Art of Flower';
  final String description = 'Learn to grow perfect flower';
  final String chef = 'Huynh Huu Loc';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(recipe.backgroundImage), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: Stack(
          children: <Widget>[
            Text(recipe.subtitle, style: FooderlichTheme.darkTextTheme.bodyText1,),
            Positioned(child: Text(recipe.title, style: FooderlichTheme.darkTextTheme.headline5,),
            top: 20,),
            Positioned(child: Text(recipe.message, style: FooderlichTheme.darkTextTheme.bodyText1,),
            bottom: 30,
            right: 0,),
            Positioned(child: Text(recipe.authorName, style: FooderlichTheme.darkTextTheme.bodyText1,),
            bottom: 10,
            right: 0,),
          ],
        ),
      ),
    );
  }
}
