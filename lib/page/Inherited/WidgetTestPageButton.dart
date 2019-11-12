import 'package:flutter/material.dart';

import 'InheritedTestModel.dart';
import 'InheritedWidgetManger.dart';

//构造一个Button
class WidgetTestPageButton extends StatefulWidget {
  @override
  _WidgetTestPageButtonState createState() => _WidgetTestPageButtonState();
}

class _WidgetTestPageButtonState extends State<WidgetTestPageButton> {
  @override
  Widget build(BuildContext context) {

    var inheritedWidgetManger  = InheritedWidgetManger.of(context);

    return RaisedButton(

        padding: EdgeInsets.all(10),
        shape:CircleBorder(),
        color: Colors.transparent,
        child: Text("增加",style: TextStyle(color: Colors.white),),
        onPressed: () {

          var model = inheritedWidgetManger.data;
          model = InheritedTestModel(model.count + 1);

          inheritedWidgetManger.mangerState.updateData(model);

        });
  }
}
