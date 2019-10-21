import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    // 使用 IOS 风格
    return CupertinoPageScaffold(

      navigationBar: CupertinoNavigationBar(

      //添加一个标题
        middle: Text("$_title"),
      ),

      child: SafeArea(

          child: WebView(
            initialUrl: "127.0.0.1:///assets/html/JavaScriptTest.html",
            //开启Js 支持
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              //拿到controller
              _controller = controller;
            },
            onPageFinished: (url) {
              //获取网页的标题来显示
              _controller.evaluateJavascript("document.title").then((result) {
                setState(() {
                  _title = result;
                });
              }
              );
              print("输出当前地址：" + url);
            },
            navigationDelegate: (NavigationRequest request) {
              //拦截 百度账号登录跳转
              if (request.url.startsWith(
                  "https://wappass.baidu.com/passport/?login")) {
                ToastUtil.show("请求被拦截到诺  哈哈");

                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          )
      ),
    );
  }



  Widget getWebView(){

    return WebView(
      initialUrl: "https://flutterchina.club/",
      //JS执行模式 是否允许JS执行
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      onPageFinished: (url) {
        _controller.evaluateJavascript("document.title").then((result){
          setState(() {
            _title = result;
          });
        }
        );
      },
      navigationDelegate: (NavigationRequest request) {
        if(request.url.startsWith("myapp://")) {
          print("即将打开 ${request.url}");

          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      } ,
      javascriptChannels: <JavascriptChannel>[
        JavascriptChannel(
            name: "share",
            onMessageReceived: (JavascriptMessage message) {
              print("参数： ${message.message}");
            }
        ),
      ].toSet(),

    );
  }

}