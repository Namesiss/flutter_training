import 'package:flutter/material.dart';
import 'package:flutter_training/constraints.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(30),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //TODO 4: Add empty Image
          AspectRatio(aspectRatio: 1 / 1,child: Image.asset('assets/fooderlich_assets/empty_list.png'),),
          //TODO 5: Add empty Screen builder
          SizedBox(height: 8,),
          Text('Chưa có qué gì :(', style: TextStyle(fontSize: 21.0),),

          //TODO 6: Add empty Screen subtitle
          SizedBox(height: 16,),
          Text(
            'Bạn muốn mua nguyên liệu khum?\n'
                'Bấm nút dưới để thêm chúng vào nào!',
            textAlign: TextAlign.center,
          ),
          //TODO 7: Add browser recipes button
          MaterialButton(
            child: Text('Chơi lun'),
              textColor: Colors.white,
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {

          })
        ],
      ),
    ),);
  }
}
