import 'dart:convert';
import 'dart:io';

void main() {

 //绑定地址和端口，获取套接字，监听每个连接
  ServerSocket.bind(InternetAddress.loopbackIPv4, 8000).then((serverSocket) {

    //监听客户端发送过来的数据
    serverSocket.listen((socket) {

      //得到客户端的 socket,取出数据
      socket.listen((data) {
        
        print("接收到来自Client的数据:  ${utf8.decode(data)}");
        
        //向客户端会送一条数据
        var content = "收到你的数据 ${utf8.decode(data)}";

        //向客户端推送数据
        socket.write(content);
      });
    });
  });
}
