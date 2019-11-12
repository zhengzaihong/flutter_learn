import 'package:flutter/material.dart';

import 'InheritedWidgetManger.dart';

// 第一个页面
class WidgetTestPageOne extends StatefulWidget {

  @override
  _WidgetTestPageOneState createState() => _WidgetTestPageOneState();
}

class _WidgetTestPageOneState extends State<WidgetTestPageOne> {


  @override
  Widget build(BuildContext context) {

    final myInheritedWidget = InheritedWidgetManger.of(context);

    final inheritedTestModel = myInheritedWidget.data;

    print("WidgetTestPageOne____${inheritedTestModel.count}");

    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: Text("One页面获取到最新值：${inheritedTestModel.count}"));
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("WidgetTestPageOne___didChangeDependencies");
  }


}
