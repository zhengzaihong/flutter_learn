import 'package:flutter/material.dart';
import 'InheritedTestModel.dart';
import 'MyInheritedWidget.dart';


class InheritedWidgetManger extends StatefulWidget {


  final Widget child;

   InheritedTestModel data;

  InheritedWidgetManger({Key key, this.child, this.data}) : super(key: key);


  @override
  InheritedWidgetMangerState createState() => InheritedWidgetMangerState();

  //定义一个方法，方便子树中的widget获取共享数据
  static MyInheritedWidget of(BuildContext context, {bool rebuild = true}) {
    return rebuild
        ? context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
        : ((context.findAncestorWidgetOfExactType<MyInheritedWidget>()));
  }

}

class InheritedWidgetMangerState extends State<InheritedWidgetManger> {
  @override
  Widget build(BuildContext context) {

    //将最新的数据往下传递
    return MyInheritedWidget(
      data: widget.data,
      child: widget.child,
      mangerState: this,
    );
  }

  //提供一个方法修改数据，并通知子组件 刷新
  void updateData(InheritedTestModel model) {
    setState(() {
      widget.data = model;
    });
  }
}
