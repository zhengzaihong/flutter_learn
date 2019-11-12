import 'package:flutter/material.dart';
import 'package:flutter_learn/page/dataprovider/provider/ChangeNotifierProvider.dart';
import 'package:flutter_learn/page/dataprovider/provider/InheritedDataModel.dart';

import '../Inherited/MyInheritedWidget.dart';


//第四个页面
class WidgetTestPageFour extends StatefulWidget {
  @override
  _WidgetTestPageFourState createState() => _WidgetTestPageFourState();
}

class _WidgetTestPageFourState extends State<WidgetTestPageFour> {

  @override
  Widget build(BuildContext context) {

    var dataModel=ChangeNotifierProvider.of<InheritedDataModel>(context);

    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),

        child: Text("Four页面获取到最新值：${dataModel}"));
  }
}

