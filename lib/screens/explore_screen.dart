import 'package:flutter/material.dart';
import 'package:flutter_training/api/mock_fooderlich_service.dart';
import 'package:flutter_training/components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO 1
    return FutureBuilder(
    future: mockService.getExploreData(),
    builder: (context, snapshot) {
      //TODO: Add Nested ListView
      if (snapshot.connectionState == ConnectionState.done) {
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            ToDayRecipeListView(recipes: snapshot.data.todayRecipes,),
            SizedBox(height: 16,),
            FriendPostListView(posts: snapshot.data.friendPosts,),
            Container(
              height: 400,
              color: Colors.grey,
            )
          ],
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
