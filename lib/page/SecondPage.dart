      import 'package:flutter/material.dart';

      class SecondPage extends StatelessWidget {

        final arguments;

        SecondPage({this.arguments});

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            //这里也添加一个返回按钮。
            floatingActionButton: FloatingActionButton(
              child: Text('返回'),
              onPressed: (){
                // 返回上一个页面
                Navigator.pop(context);
              },
            ),
            appBar: AppBar(
              title: Text("第二个界面"),
            ),
            body: Center(
              child: Text("这是第二个界面 传值内容："+arguments["key"]),
            ),
          );
        }
      }
