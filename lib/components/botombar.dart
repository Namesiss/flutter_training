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
      currentIndex: currentIndex,
      onTap: tap,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/flower.svg"), label: "1"),
        BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/heart-icon.svg"), label: "2"),
        BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/user-icon.svg"), label: "3"),
      ]
    );
  }
}