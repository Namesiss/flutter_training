
import 'package:flutter/material.dart';

import '../constraints.dart';

class MoreRow extends StatelessWidget {
  const MoreRow({
    this.title,
    this.click,
    Key key,
  }) : super(key: key);
  final String title;
  final Function click;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: <Widget>[
        Recommend(text: title),
        Spacer(),
        TextButton(onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child:Text(
              "Xem thêm",
              style: TextStyle(color: Colors.white),
            ))
      ]),
    );
  }
}

class Recommend extends StatelessWidget {
  const Recommend({
    this.text,
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: 25,
      child: Stack(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}