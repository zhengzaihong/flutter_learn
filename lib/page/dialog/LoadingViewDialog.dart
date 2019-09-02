    import 'dart:async';

    import 'package:flutter/material.dart';

    /*
     * creat_user: zhengzaihong
     * Email:1096877329@qq.com
     * creat_date: 2019/9/2
     * creat_time: 9:50
     * describe  自定义dialog
     **/

    // ignore: must_be_immutable
    class LoadingViewDialog extends Dialog {

      //内容布局
      final Widget content;

      //加载中动画
      final Widget progress;

      //dialog 的宽
      double dialogWidth;

      //dialog 的高
      double dialogHight;

      //dialog 的圆角度数
      double radius;

      // dialog 的容器布局内距
      double contentPadding;

      //dialog 的背景颜色
      Color backGroundColor;

      //dialog 的最大显示时长 单位秒。
      int maxShowTime ;

      LoadingViewDialog({
        Key key,
        this.dialogWidth = 120.0,
        this.dialogHight = 120.0,
        this.content,
        this.progress,
        this.radius = 8.0,
        this.contentPadding = 20,
        this.maxShowTime = 100,
        this.backGroundColor =  Colors.white
      }) :
            super(key: key);

      @override
      Widget build(BuildContext context) {

        showTimer(context);
        return new Material( //创建透明层
          type: MaterialType.transparency, //透明类型
          child: new Center( //保证控件居中效果

            child: new SizedBox(
              width: dialogWidth,
              height: dialogHight,
              child: new Container(
                padding: EdgeInsets.all(contentPadding),
                decoration: ShapeDecoration(
                  color: backGroundColor,
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

      //添加定时
      showTimer(context) {
        Timer.periodic(Duration(milliseconds: maxShowTime*1000), (t) {
          Navigator.pop(context);
          //取消定时器
          t.cancel();
        });
      }

    }