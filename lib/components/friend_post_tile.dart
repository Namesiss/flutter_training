import 'package:flutter/material.dart';
import 'package:flutter_training/components/card2/circle_image.dart';
import 'package:flutter_training/models/models.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;

  const FriendPostTile({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(post.comment),
            Text(
              '${post.timestamp} phút trước',
              style: TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ))
      ],
    );
  }
}
