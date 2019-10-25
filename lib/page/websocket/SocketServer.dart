import 'dart:convert';
import 'dart:io';

void main() {


 //绑定地址和端口，获取套接字，监听每个连接
  ServerSocket.bind(InternetAddress.loopbackIPv4, 8000).then((serverSocket) {
    serverSocket.listen((socket) {
      socket.listen((data) {
        
        print("接收到来自Client的数据:  ${utf8.decode(data)}");
        
        //向客户端会送一条数据
        var content = "收到你的数据 ${utf8.decode(data)}";
        socket.write(content);
      });
    });
  });
}
