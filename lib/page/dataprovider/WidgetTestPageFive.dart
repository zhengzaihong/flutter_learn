import 'package:flutter/material.dart';



//第三个页面
class WidgetTestPageFive extends StatefulWidget {
  @override
  _WidgetTestPageFiveState createState() => _WidgetTestPageFiveState();
}

class _WidgetTestPageFiveState extends State<WidgetTestPageFive> {

  @override
  Widget build(BuildContext context) {


    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: Text("Five页面获取到最新值："));
  }
}

