import 'package:flutter/material.dart';

import 'InheritedWidgetManger.dart';


//第二个页面
class WidgetTestPageTwo extends StatefulWidget {
  @override
  _WidgetTestPageTwoState createState() => _WidgetTestPageTwoState();
}

class _WidgetTestPageTwoState extends State<WidgetTestPageTwo> {
  @override
  Widget build(BuildContext context) {

    //可控制的
    final inheritedWidgetManger = InheritedWidgetManger.of(context,rebuild: true);

    final inheritedTestModel = inheritedWidgetManger.data;

    print("WidgetTestPageTwo____${inheritedTestModel.count}");

    return Padding(

        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),

        child: Text("Two页面获取到最新值：${inheritedTestModel.count}"));
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("WidgetTestPageTwo___didChangeDependencies");
  }

}
