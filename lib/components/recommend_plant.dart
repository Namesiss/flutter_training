import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constraints.dart';
import 'header.dart';
import 'titleandmore.dart';

class RecommendItems extends StatelessWidget {
  const RecommendItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemRow(image: "assets/images/image_1.png" , title: "Item1" , country: "Vietnam" , price: 50000 , press: () {},),
          ItemRow(image: "assets/images/image_2.png" , title: "Item2" , country: "Australia" , price: 60000 , press: () {},),
          ItemRow(image: "assets/images/image_3.png" , title: "Item3" , country: "Vietnam" , price: 70000 , press: () {},),
          ItemRow(image: "assets/images/image_1.png" , title: "Item4" , country: "Myanmar" , price: 70000 , press: () {},),
        ],
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow({
    this.image,
    this.title,
    this.price,
    this.press,
    this.country,
    Key key,
  }) : super(key: key);

  final String image,title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset("$image"),
          Container(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.5),
                )
              ],
            ),
            child: Row(
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "$title\n".toUpperCase(),
                        style: Theme.of(context).textTheme.button,
                      ),
                      TextSpan(
                        text: "$country",
                        style: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                      )
                    ])),
                Spacer(),
                Text("$price VND",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      color: kPrimaryColor),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
