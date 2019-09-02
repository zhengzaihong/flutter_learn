
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/util/ToastUtil.dart';

import 'LoadingViewDialog.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  _alertDialog() {
    showDialog(
        //表示点击灰色背景的时候是否消失弹出框
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            //添加背景色
            backgroundColor: Colors.white,
            elevation: 1000,
            // 文字内容内距
            contentPadding: EdgeInsets.all(30),
            //标题
            title: Text("提示信息!", style: TextStyle(color: Colors.redAccent)),
            //内容
            content: Text("您确定要删除吗?"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),

            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.pop(context, 'Cancle');
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.pop(context, "Ok");
                },
              )
            ],
          );
        }).then((value) {
      ToastUtil.show("回传值：" + value);
    });
  }

  _simpleDialog() async {
    var result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("选择内容", style: TextStyle(color: Colors.blue)),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Option A"),
                onPressed: () {
                  Navigator.pop(context, "A");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("Option B"),
                onPressed: () {
                  Navigator.pop(context, "B");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("Option C"),
                onPressed: () {
                  Navigator.pop(context, "C");
                },
              ),
              Divider(),
            ],
          );
        });

    ToastUtil.show("回传值：" + result);
  }

  _modelBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: 220,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      "分享",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 80,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.chat,
                              color: Colors.green,
                              size: 40,
                            ),
                            SizedBox(height: 10),
                            Text('微信',
                                style: TextStyle(color: Colors.deepPurple)),
                          ],
                        )),
                    Container(
                        width: 140,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.question_answer,
                              color: Colors.green,
                              size: 40,
                            ),
                            SizedBox(height: 10),
                            Text('QQ',
                                style: TextStyle(color: Colors.deepPurple)),
                          ],
                        )),
                    Container(
                        width: 80,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.web,
                              color: Colors.green,
                              size: 40,
                            ),
                            SizedBox(height: 10),
                            Text('微博',
                                style: TextStyle(color: Colors.deepPurple)),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 20),
                FlatButton(
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.grey,
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("取消"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    //按钮点击回调
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
          );
        });
  }

  _showCupertinoAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("iOS风格的对话框"),
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  child: Text("你确定不关注我吗？"),
                  alignment: Alignment(0, 0),
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("取消"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text("确定"),
                onPressed: () {},
              ),
            ],
          );
        });
  }



    _LoadingDialog() {
      showDialog(
          context: context, //BuildContext对象
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LoadingViewDialog(
              //调用对话框

                progress: CircularProgressIndicator(
                  strokeWidth: 3,
                  //背景颜色
                  backgroundColor: Colors.red,
                  //进度颜色
                ),

//              progress: LinearProgressIndicator(
//                  //背景颜色
//                  backgroundColor: Colors.yellow,
//                  //进度颜色
//                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
//              ),

              content: Text(
                '正在加载...',
                style: TextStyle(color: Colors.blue),
              ),
              maxShowTime: 5,
            );
          });

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dialog"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                child: Text('AlertDialog对话框'),
                onPressed: _alertDialog,
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('SimpleDialog 对话框'),
                onPressed: _simpleDialog,
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('showModalBottomSheet 底部弹出框'),
                onPressed: _modelBottomSheet,
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('IOS AlertDialog 对话框'),
                onPressed: _showCupertinoAlertDialog,
              ),
              SizedBox(height: 20),
              SizedBox(
                child: LinearProgressIndicator(
                    //背景颜色
                    backgroundColor: Colors.yellow,
                    //进度颜色
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
                height: 8.0,
                width: 200,
              ),
              SizedBox(height: 20),
              new SizedBox(
                //限制进度条的高度
                height: 40.0,
                //限制进度条的宽度
                width: 40,
                child: new CircularProgressIndicator(
                    strokeWidth: 3,
                    //背景颜色
                    backgroundColor: Colors.yellow,
                    //进度颜色
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('加载提示框'),
                onPressed: _LoadingDialog,
              ),
            ],
          ),
        ));
  }
}
