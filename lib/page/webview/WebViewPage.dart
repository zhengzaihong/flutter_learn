import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/util/ToastUtil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {

  WebViewController _controller;
  String _title = "webview";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      ///FloatingActionButton
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(
          Icons.send,
          size: 30,
        ),
        onPressed: () {
          //点击触发 调用 js 方法
          _controller.evaluateJavascript("flutterCallJs('这是客户端传过来的值')");

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      appBar: AppBar(
        title: Text(_title),
        // 控制 WebView 返回（依次返回界面）
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed:(){

            _controller.canGoBack().then((value){

              if(value){
                _controller.goBack();
              }else{
                 Navigator.pop(context);
              }
            });
          },
        )
      ),

      body: SafeArea(

          child: WebView(
            
            initialUrl: "http://www.baidu.com",
            //开启Js 支持
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              //拿到controller
              _controller = controller;

            //  _loadHtmlFromAssets();
            },
            onPageFinished: (url) {

              //获取网页的标题来显示
              _controller.evaluateJavascript("document.title").then((result) {
                setState(() {
                  _title = result;
                });
              });
              print("输出当前地址：" + url);
            },

            javascriptChannels: <JavascriptChannel>[
              JavascriptChannel(

                  // 双方约定好的 协议
                  name: "flutterTest",
                  onMessageReceived: (JavascriptMessage message) {

                    print("输出参数： ${message.message}");
                    ToastUtil.show(message.message);

                  }
              ),
            ].toSet(),
          )
      ),
    );
  }

//  从本地加载html文件，需要使用异步操作
  _loadHtmlFromAssets() async {

    String fileText = await rootBundle.loadString('assets/html/JavaScriptTest.html');

    _controller.loadUrl(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());

  }


}