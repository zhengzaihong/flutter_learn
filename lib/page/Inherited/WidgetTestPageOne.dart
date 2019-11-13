import 'package:flutter/material.dart';


// 第一个页面
class WidgetTestPageOne extends StatefulWidget {

  @override
  _WidgetTestPageOneState createState() => _WidgetTestPageOneState();
}

class _WidgetTestPageOneState extends State<WidgetTestPageOne> {


  @override
  Widget build(BuildContext context) {

    print("WidgetTestPageOne___build");

    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: Text("One页面不参与订阅："));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("WidgetTestPageOne___didChangeDependencies");
  }

}
