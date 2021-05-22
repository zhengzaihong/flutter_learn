import 'package:flutter/material.dart';
import 'package:flutter_learn/util/ToastUtil.dart';

import 'FunIconButton.dart';

class RaisedButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(

           ///FloatingActionButton
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              child: Icon(
                Icons.send,
                size: 30,
              ),
              onPressed: () {},
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

            appBar: AppBar(
              title: Text("RaisedButtonPage"),
            ),
            body: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ///RaisedButton

                    Row(
                      children: <Widget>[
                        SizedBox(width: 5),
                        RaisedButton(
                          child: Text('无事件按钮'),
                        ),
                        SizedBox(width: 5),
                        RaisedButton(
                          child: Text('普通按钮'),
                          onPressed: () {},
                        ),
                        SizedBox(width: 5),
                        RaisedButton(
                          color: Colors.pink,
                          textColor: Colors.white,
                          child: Text('颜色按钮'),
                          onPressed: () {},
                        ),
                        SizedBox(width: 5),
                        RaisedButton(
                          elevation: 20,
                          focusElevation: 40,
                          child: Text('阴影按钮'),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    Divider(),

                    Row(
                      children: <Widget>[
                        SizedBox(width: 5),
                        Container(
                          width: 200,
                          height: 50,
                          child: RaisedButton(
                            child: Text('宽：200,高：50 按钮'),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 220,
                          height: 40,
                          child: RaisedButton(
                            color: Colors.pink,
                            textColor: Colors.white,
                            child: Text('宽：220,高：40 按钮'),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),

                    Divider(),

                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            child: RaisedButton(
                              child: Text('组合控制自适应'),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.pink,
                        textColor: Colors.white,
                        child: Text('无穷宽值方式'),
                        onPressed: () {},
                      ),
                    ),

                    SizedBox(height: 5),

                    RaisedButton(
                      child:
                          Text('圆角按钮', style: TextStyle(color: Colors.white)),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                    ),

                    SizedBox(height: 5),

                    SizedBox(
                      height: 70,
                      child: RaisedButton(
                        child:
                            Text('圆形按钮', style: TextStyle(color: Colors.white)),
                        color: Colors.green,
                        shape: CircleBorder(
                          side: BorderSide(color: Colors.blue),
                        ),
                        onPressed: () {},
                      ),
                    ),

                    SizedBox(height: 5),
                    RaisedButton.icon(
                      color: Colors.pink,
                      textColor: Colors.white,
                      icon: Icon(Icons.settings),
                      label: Text('图标按钮'),
                      onPressed: () {},
                    ),

                    SizedBox(height: 5),

                    ///  FunIconButton 自定义按钮

                    FunIconButton(
                      label: Text('多功能按钮',
                          style: TextStyle(color: Colors.deepPurple)),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        ToastUtil.show("点击了");
                      },
                      minWidth: 240,
                      leftIcon: Image.asset(
                        "images/mm.jpg",
                        width: 24,
                        height: 24,
                      ),
                      rightIcon: Icon(Icons.group),
                      topIcon: Icon(Icons.save),
                      bottomIcon: Icon(Icons.score),
                      textPadding: EdgeInsets.only(left: 10, right: 10),
                    ),

                    SizedBox(height: 5),

                    ///FlatButton 扁平化按钮

                    FlatButton(
                      //按钮文字颜色
                      textColor: Colors.white,
                      //按钮禁用时的背景颜色
                      disabledColor: Colors.grey,
                      //按钮禁用时的文字颜色
                      disabledTextColor: Colors.grey,
                      //正常状态下的背景颜色
                      color: Colors.blue,
                      //按钮按下时的背景颜色
                      highlightColor: Colors.blue[700],
                      //按钮主题，默认是浅色主题
                      colorBrightness: Brightness.dark,
                      //外形
                      splashColor: Colors.grey,
                      // button 显示的文字
                      child: Text("纳尼"),
                      //圆角边框
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      //按钮点击回调
                      onPressed: () => {},
                    ),

                    ///OutlineButton

                    OutlineButton(
                      borderSide: BorderSide(color: Colors.red),
                      child: Text('边框按钮'),
                      onPressed: () {},
                    ),
                    OutlineButton(
                      borderSide: BorderSide(
                          color: Colors.blue, style: BorderStyle.solid),
                      child: Text('边框按钮'),
                      onPressed: () {},
                    ),

                    ///IconButton
                    IconButton(
                      splashColor: Colors.pink,
                      color: Colors.pink,
                      icon: Icon(
                        Icons.send,
                        size: 50,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      splashColor: Colors.pink,
                      color: Colors.pink,
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),


                    ///ButtonBar

                    ButtonBar(
                      alignment:MainAxisAlignment.center ,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.pink,
                          textColor: Colors.white,
                          child: Text('按钮组'),
                          onPressed: () {},
                        ),
                        FlatButton(
                          color: Colors.pink,
                          textColor: Colors.white,
                          child: Text('按钮组'),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                )
              ],





            )));
  }
}
