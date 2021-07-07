import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/components/card1/recommend_plant.dart';
import '../../constraints.dart';
import 'featured_plant_scroll.dart';
import 'header.dart';
import 'titleandmore.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Cung cấp w và h
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Header(size: size),
        MoreRow(
          title: "Cây tiêu biểu",
          click: () {},
        ),
        RecommendItems(),
        MoreRow(
          title: "Cây đáng chú ý",
          click: () {},
        ),
        FeaturedPlantScroll(),
        SizedBox(height: kDefaultPadding,),

      ],
    ));
  }
}


