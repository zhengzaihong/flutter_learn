import 'dart:io';
import 'dart:convert';

main() {

  //创建一个数据包 并绑定地址和端口
  var rawDgramSocket = RawDatagramSocket.bind(
      InternetAddress.loopbackIPv4, 8001);


  rawDgramSocket.then((socket) {
    //监听套接字事件
    socket.listen((event) {
      if (event == RawSocketEvent.read) {
        //通过事件 socket.receive 获取数据
        print(utf8.decode(socket.receive().data));
        socket.send(utf8.encode("已收到！"), InternetAddress.loopbackIPv4, 8002);
      }
    });
  });
}