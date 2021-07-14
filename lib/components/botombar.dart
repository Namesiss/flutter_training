import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constraints.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    this.tap,
    this.currentIndex,
    Key key,
  }) : super(key: key);
  final Function tap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kTextColor,
        currentIndex: currentIndex,
        onTap: tap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/flower.svg",
                color: currentIndex == 0 ? kPrimaryColor : kTextColor,
              ),
              label: "SP&Stream"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Recipes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "To Buy"),
        ]);
  }
}
