import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/page/dialog/LoadingViewDialog.dart';

class IsolatePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return IsolatePageState();
  }
}


class IsolatePageState extends State<IsolatePage> {

  var content = "计算中...";


  static Future<dynamic> calculation(int n) async{

    //首先创建一个ReceivePort，因为创建isolate所需的参数，必须要有SendPort，SendPort需要ReceivePort来创建
    final response = new ReceivePort();
    //开始创建isolate,createIsolate是创建isolate必须要的参数。
    Isolate isolate = await Isolate.spawn(createIsolate,response.sendPort);

    //获取sendPort来发送数据
    final sendPort = await response.first as SendPort;
    //接收消息的ReceivePort
    final answer = new ReceivePort();
    //发送数据
    sendPort.send([n,answer.sendPort]);

    //获得数据并返回
    return answer.first;
  }

//创建isolate必须要的参数
  static void createIsolate(SendPort initialReplyTo){
    final port = new ReceivePort();
    //绑定
    initialReplyTo.send(port.sendPort);
    //监听
    port.listen((message){
      //获取数据并解析
      final data = message[0] as num;
      final send = message[1] as SendPort;
      //返回结果
      send.send(sum(data));
    });

  }

  //计算0到 num 数值的总和
  static num sum(int num) {
    int count = 0;
    while (num > 0) {
      count = count+num;
      num--;
    }
    return count;
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(

      ///FloatingActionButton
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Text('计算'),
        onPressed: () {

//          calculation(100000000).then((onValue){
//            setState(() {
//              content = "总和$onValue";
//              print("计算结果：$onValue");
//            });

          compute(sum,100000000).then((onValue){
            setState(() {
              content = "总和$onValue";
              print("计算结果：$onValue");
            });
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      appBar: AppBar(
        title: Text("Isolate"),
      ),

      body: SafeArea(
          child:Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 400,
                  //前面章节中的自定义View
                  child: LoadingViewDialog(
                    dialogWidth: double.infinity,
                      //调用对话框
                    progress: CircularProgressIndicator(
                      strokeWidth: 3,
                      //背景颜色
                      backgroundColor: Colors.red,
                    ),

                    content: Text(
                      content,
                      style: TextStyle(color: Colors.blue),
                    ),
                    maxShowTime: 10000,
                  )
                ),
              ],
            ),
          ),
      ),
    );
  }


}