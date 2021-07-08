import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constraints.dart';

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
              label: "1"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/heart-icon.svg",
                  color: currentIndex == 1 ? kPrimaryColor : kTextColor
              ),
              label: "2"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/user-icon.svg",
                  color: currentIndex == 2 ? kPrimaryColor : kTextColor
              ),
              label: "3"),
        ]);
  }
}
