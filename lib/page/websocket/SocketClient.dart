

import 'dart:convert';
import 'dart:io';

void main(){

  //创建一个Socket连接到指定地址与端口
  Socket.connect(InternetAddress.loopbackIPv4, 8000).then((socket) {

    //向服务端发送数据
    socket.write('你好啊 我是客户端');

    print(socket.address);

    //向服务端发送数据
    socket.add(utf8.encode("客户端通过 add 方式发生的数据"));


    //监听服务端的发送过来数据
    socket.listen((data) {

      print("接收到来自Server的数据：${utf8.decode(data)}");
    });

  });

}