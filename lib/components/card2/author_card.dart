import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/components/card2/circle_image.dart';
import 'package:flutter_training/components/card2/fooderlich_theme.dart';

class AuthorCard extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  const AuthorCard({Key key,
  this.authorName,
    this.title,
    this.imageProvider
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              CircleImage(imageProvider: imageProvider, imageRadius: 28),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,),
                    Text(title,style: FooderlichTheme.lightTextTheme.headline3,)
                ],
              )
            ],
          ),
          IconButton(icon: Icon(Icons.camera_front),
              iconSize: 30,
              color: Colors.grey[400],
              onPressed: (){
            const snackBar = SnackBar(content: Text('Press Favorite'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          })
        ],
      ),
    );
  }
}
