import 'dart:io';
import 'dart:convert';

main() {

  //创建一个数据包 并绑定地址和端口
  var rawDgramSocket = RawDatagramSocket.bind(InternetAddress.loopbackIPv4, 8002);

  rawDgramSocket.then((socket) {

    socket.send(utf8.encode("你好服务端！"), InternetAddress.loopbackIPv4, 8001);

    socket.listen((event) {
      if(event == RawSocketEvent.read) {
        //打印服务端的数据
        print("来自服务端的数据  ${utf8.decode(socket.receive().data)}");
      }
    });
  });
}