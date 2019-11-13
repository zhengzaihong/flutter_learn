import 'package:flutter/cupertino.dart';

import 'InheritedTestModel.dart';
import 'InheritedWidgetManger.dart';


// 组件共享数据的容器
class MyInheritedWidget extends InheritedWidget {

  //数据的Mode
  InheritedTestModel data;

  InheritedWidgetMangerState mangerState;

  MyInheritedWidget({
    Key key,
    @required this.data,
    @required Widget child,
    this.mangerState
  }) : super(key: key, child: child);


  //是否重建widget就取决于数据是否相同
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {

    //判断数据是否反生改变，如果为真 所有子组件的 build 方法会被调用;
    // 有状态组件 didChangeDependencies()方法会被调用
    return data != oldWidget.data;
  }
}