import 'package:flutter/material.dart';
import 'package:flutter_training/constraints.dart';
import 'package:flutter_training/models/grocery_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryTitle extends StatelessWidget {
  final GroceryItem item;
  final Function(bool) onComplete;
  final TextDecoration textDecoration;

  // When you initialize a GroceryTile, you check
  // the item to see if the user marked it as
  // complete. If so, you show a strike through
  // the text. Otherwise, you display the text as
  // normal.
  GroceryTitle({
    Key key,
    this.item,
    this.onComplete,
  })  : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO 21
    return Container(
      height: 100,
      //TODO 20: Replace color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //TODO 22: Add Row to group (name, date, quantity)
          FirstRow(),
          SecondRow()
          //TODO 23: Add Row to group (quantity, checkbox)
        ],
      ),
    );
  }

  Widget BuildInportance() {
    switch (item.importance) {
      case Importance.low:
        {
          return Text(
            'Low',
            style: GoogleFonts.lato(decoration: textDecoration),
          );
        }
      case Importance.medium:
        {
          return Text(
            'Medium',
            style: GoogleFonts.lato(decoration: textDecoration),
          );
        }
      case Importance.high:
        {
          return Text(
            'High',
            style: GoogleFonts.lato(decoration: textDecoration),
          );
        }
      default:
        {
          throw Exception('This importance type does not exists!');
        }
    }
  }

  Widget BuildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget BuildCheckbox() {
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }

  Widget FirstRow() {
    return Row(
      children: [
        Container(
          width: 5.0,
          color: item.color,
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: GoogleFonts.lato(
                decoration: textDecoration,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            BuildDate(),
            SizedBox(
              height: 4.0,
            ),
            BuildInportance()
          ],
        )
      ],
    );
  }

  Widget SecondRow() {
    return Row(
      children: [
        Text(
          item.quantity.toString(),
          style: GoogleFonts.lato(decoration: textDecoration, fontSize: 21.0),
        ),
        BuildCheckbox()
      ],
    );
  }
}
