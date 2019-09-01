import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {

  //内容布局
  final Widget content;
  //加载中动画
  final Widget progress;

  double dialogWidth;

  double dialogHight;

  double radius = 8;

  double contentPadding;

  LoadingDialog({
    Key key,
    this.dialogWidth = 120.0,
    this.dialogHight = 120.0,
    this.content,
    this.progress,
    this.radius = 8.0
    this.contentPadding,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material( //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center( //保证控件居中效果

        child: new SizedBox(
          width: dialogWidth,
          height: dialogHight,
          child: new Container(
            padding: EdgeInsets.all(contentPadding),
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                progress,
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: content
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}