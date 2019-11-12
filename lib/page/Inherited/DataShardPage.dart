import 'package:flutter/material.dart';

import 'InheritedTestModel.dart';
import 'InheritedWidgetManger.dart';
import 'WidgetTestPageButton.dart';
import 'WidgetTestPageOne.dart';
import 'WidgetTestPageThree.dart';
import 'WidgetTestPageTwo.dart';

////主界面
class DataShardPage extends StatefulWidget {
  @override
  _DataShardPageState createState() => _DataShardPageState();
}

class _DataShardPageState extends State<DataShardPage> {
  //用于存储数据的 Mode,初始化数据 为 0
  InheritedTestModel inheritedTestModel = InheritedTestModel(0);

  @override
  Widget build(BuildContext context) {
    //在该组件下的 子组件可以收到消息通知
    return InheritedWidgetManger(
        data: inheritedTestModel,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              child: WidgetTestPageButton(),
//              child: Text('增加'),
//              onPressed: () {
//                setState(() {
//                  //修改共享的数据，并刷新子组件
//                  inheritedTestModel.count = inheritedTestModel.count + 1;
//                });

//              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            appBar: AppBar(
              title: Text("InheritedWidget"),
            ),
            body: Center(
                child: ListView(
              children: <Widget>[
                //创建 三个 页面
                WidgetTestPageOne(),

                WidgetTestPageTwo(),

                WidgetTestPageThree(),
              ],
            ))));
  }
}
