import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../constraints.dart';
import 'header.dart';
import 'titleandmore.dart';

class FeaturedPlantScroll extends StatelessWidget {
  const FeaturedPlantScroll({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturedPlant(
            press: () {},
            image: "assets/images/bottom_img_1.png",),
          FeaturedPlant(
            press: () {},
            image: "assets/images/bottom_img_2.png",),
          FeaturedPlant(
            press: () {},
            image: "assets/images/bottom_img_1.png",),
        ],
      ),
    );
  }
}

class FeaturedPlant extends StatelessWidget {
  const FeaturedPlant({
    Key key,
    this.size,
    this.image,
    this.press,
  }) : super(key: key);
  final String image;
  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image))),
      ),
    );
  }
}