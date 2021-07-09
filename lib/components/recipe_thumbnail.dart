import 'package:flutter/material.dart';
import 'package:flutter_training/models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;

  const RecipeThumbnail({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
                child: Image.asset('${recipe.dishImage}', fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            recipe.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
