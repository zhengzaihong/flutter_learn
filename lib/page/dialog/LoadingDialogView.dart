import 'dart:async';

import 'package:flutter/material.dart';

class LoadingDialogView extends Dialog {
  //子布局
  final Widget child;

  //内容布局
  final Widget content;

  //加载中动画
  final Widget progress;

  //背景透明度
  final double alpha;

  //字体颜色
  final Color textColor;

  double dialogWidth =200;

  double dialogHight = 200;

  LoadingDialogView({
    Key key,
    @required this.child,
    this.dialogWidth,
    this.dialogHight,
    this.content,
    this.progress,
    this.alpha = 0.6,
    this.textColor = Colors.white,
  })
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {

      List<Widget> widgetList = [];
      widgetList.add(child);
      Widget layoutProgress;
      if (content == null) {
        layoutProgress = Center(
          child: progress,
        );
      } else {
        layoutProgress = Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                progress,
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: content,
                )
              ],
            ),
          ),
        );
      }
      widgetList.add(Opacity(
        opacity: alpha,
        child: new ModalBarrier(color: Colors.black87),
      ));
      widgetList.add(layoutProgress);

      showDialog(context: context ,builder: (BuildContext context){

        return Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(

                  height: dialogHight,
                  width: dialogWidth,
                  color: Colors.red,
                  child: Column(
                      children: widgetList

                  )),
            ));
      });
  }
}