import 'package:flutter/material.dart';
import 'package:flutter_training/api/mock_fooderlich_service.dart';
import 'package:flutter_training/components/friend_post_list_view.dart';
import 'package:flutter_training/components/today_recipes_list_view.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}


class _ExploreScreenState extends State<ExploreScreen> {
  final mockSv = MockFooderlichService();
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockSv.getExploreData(),
        builder: (context, snapshot) {
          //TODO: Add Nested ListView
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: [
                ToDayRecipeListView(recipes: snapshot.data.todayRecipes,),
                SizedBox(height: 16,),
                FriendPostListView(posts: snapshot.data.friendPosts,),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  void _scrollListener() {
    if(_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      print('Bottom reached!');
    }

    if(_controller.offset <= _controller.position.minScrollExtent && !_controller.position.outOfRange){
      print('Top reached');
    }
  }
}
