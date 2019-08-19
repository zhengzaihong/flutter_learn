    import 'package:flutter/material.dart';

    class SecondPage extends StatelessWidget {

      String value;

      //构造函数接收一个可选命名参数
      SecondPage({this.value = ""});


      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("第二个界面"),
          ),
          body: Center(
            child: Text("这是第二个界面${this.value}"),
          ),
        );
      }
    }
