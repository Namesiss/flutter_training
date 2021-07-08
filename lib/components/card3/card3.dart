import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/components/card2/fooderlich_theme.dart';
import 'package:flutter_training/models/explore_recipe.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;
  const Card3({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(height: 450, width: 350),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(recipe.backgroundImage),
                fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: <Widget>[
            //TODO 5
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
            //TODO 6
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.book, color: Colors.white,size: 40,),
                  SizedBox(height: 8,),
                  Text(recipe.title, style:
                    FooderlichTheme.darkTextTheme.headline2,),
                  SizedBox(height: 30,)
                ],
              ),
            ),
            //TODO 7
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                children: <Widget>[
                  Chip(
                    label: Text('Healthy',
                    style: FooderlichTheme.darkTextTheme.bodyText1,),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      print('Deleted');
                    },
                  ),
                  Chip(
                    label: Text('Balance',
                      style: FooderlichTheme.darkTextTheme.bodyText1,),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      print('Deleted');
                    },
                  ),
                  Chip(
                    label: Text('Fit',
                      style: FooderlichTheme.darkTextTheme.bodyText1,),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      print('Deleted');
                    },
                  ),
                  Chip(
                    label: Text('Fat-free',
                      style: FooderlichTheme.darkTextTheme.bodyText1,),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      print('Deleted');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
