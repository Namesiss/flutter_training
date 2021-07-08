import 'package:flutter/material.dart';
import 'package:flutter_training/components/components.dart';
import 'package:flutter_training/models/models.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> posts;
  const FriendPostListView({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 16,top: 0,right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
      'Social Chefs',
      style: Theme.of(context).textTheme.headline1,),
        SizedBox(height: 16,),
        //TODO: ADD POSTLIST VIEW
        ListView.separated(
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
          final post = posts[index];
          return FriendPostTile(post: post,);
        }, separatorBuilder: (context, index) {
          return SizedBox(height: 16);
        }, itemCount: posts.length),
        SizedBox(height: 16,)
      ],
    ),);
  }
}
