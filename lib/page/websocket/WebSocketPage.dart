import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/html.dart';

import 'package:web_socket_channel/io.dart';

class WebSocketPage extends StatefulWidget {
  @override
  _WebSocketPageState createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {

  TextEditingController sendController = new TextEditingController();
  TextEditingController reciverController = new TextEditingController();

  //声明一个句柄
  IOWebSocketChannel channel;

  HtmlWebSocketChannel htmlWebSocketChannel;
  var sendContent = "";


  @override
  void initState() {
    super.initState();

    //添加监听
    sendController.addListener(() {
      sendContent = sendController.text;
    });

    //创建对象 并建立连接
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocketPage"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: <Widget>[
            Form(
              child: Row(
                children: <Widget>[
                  SizedBox(
                      width: 200,
                      child: TextFormField(
                        autofocus: false,
                        controller: sendController,
                        decoration: InputDecoration(
                            labelText: "发送者",
                            hintText: "请输入要发送的内容",
                         ),
                      )),
                  SizedBox(width: 10),
                  RaisedButton(
                    child: Text("发送"),
                    onPressed: () {
                      if (sendContent.isNotEmpty) {
                        channel.sink.add(sendContent);
                      }
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 30),

            Text("来自另个程序的信息"),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                var backContent = "";
                //网络错误
                if (snapshot.hasError) {
                  backContent = "网络不通...";
                } else if (snapshot.hasData) {
                  backContent = "收到内容: " + snapshot.data;
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(backContent),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
