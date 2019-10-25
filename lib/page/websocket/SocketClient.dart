

import 'dart:convert';
import 'dart:io';

void main(){

  //创建一个Socket连接到指定地址与端口
  Socket.connect(InternetAddress.loopbackIPv4, 8000).then((socket) {

    socket.write('你好啊 我是客户端');

    print(socket.address);
    socket.add(utf8.encode("sfafsfs"));


    socket.listen((data) {
      print("接收到来自Server的数据：${utf8.decode(data)}");
    });

  });

  Socket.startConnect(InternetAddress.loopbackIPv4, 8000).then((value) {

    value.socket.then((socket){

      print(socket.address);
      socket.add(utf8.encode("sfafsfs"));

      socket.listen((data) {
        print("接收到来自Server的数据：${utf8.decode(data)}");
      });

      socket.close();

    });

  });
}