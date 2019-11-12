import 'package:flutter/material.dart';
import 'InheritedWidgetManger.dart';


//第三个页面
class WidgetTestPageThree extends StatefulWidget {
  @override
  _WidgetTestPageThreeState createState() => _WidgetTestPageThreeState();
}

class _WidgetTestPageThreeState extends State<WidgetTestPageThree> {

  @override
  Widget build(BuildContext context) {

    final myInheritedWidget = InheritedWidgetManger.of(context);
    final inheritedTestModel = myInheritedWidget.data;

    print("WidgetTestPageThree____${inheritedTestModel.count}");

    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: Text("Three页面获取到最新值：${inheritedTestModel.count}"));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("WidgetTestPageThree___didChangeDependencies");
  }

}

