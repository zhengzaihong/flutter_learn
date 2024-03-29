      import 'package:flutter/material.dart';
      import 'package:flutter_learn/page/AppBarPage.dart';
      import 'package:flutter_learn/page/SecondPage.dart';
      import 'package:flutter_learn/page/TabBarControllerPage.dart';
      import 'package:flutter_learn/page/Tabs.dart';
      import 'package:flutter_learn/page/button/RaisedButtonPage.dart';
      import 'package:flutter_learn/page/database/DataBasePage.dart';
      import 'package:flutter_learn/page/Inherited/DataShardPage.dart';
      import 'package:flutter_learn/page/dialog/DialogPage.dart';
      import 'package:flutter_learn/page/form/FormPage.dart';
      import 'package:flutter_learn/page/isolate/IsolatePage.dart';
      import 'package:flutter_learn/page/persistence/PersistenPage.dart';
      import 'package:flutter_learn/page/pop/PopViewPage.dart';
      import 'package:flutter_learn/page/scrollview/ScrollerViewPage.dart';
      import 'package:flutter_learn/page/time/TimePickerPage.dart';
      import 'package:flutter_learn/page/websocket/WebSocketPage.dart';
      import 'package:flutter_learn/page/webview/WebViewPage.dart';


      //配置路由
      final routes={

         //如有多个，请在这里添加即可。

        '/':(context)=>Tabs(),

        '/SecondPage':(context,{arguments})=>SecondPage(arguments:arguments),

        '/AppBarPage':(context)=>AppBarPage(),

        '/TabBarControllerPage':(context)=>TabBarControllerPage(),

        '/RaisedButtonPage':(context)=>RaisedButtonPage(),

        '/FormPagePage':(context)=>FormPagePage(),

        '/ScrollerViewPage':(context)=>ScrollerViewPage(),

        '/DialogPage':(context)=>DialogPage(),

        '/PersistenPage':(context)=>PersistenPage(),

        '/DataBasePage':(context)=>DataBasePage(),

        '/PopViewPage':(context)=>PopViewPage(),

        '/TimePickerPage':(context)=>TimePickerPage(),

        '/WebViewPage':(context)=>WebViewPage(),

        '/IsolatePage':(context)=>IsolatePage(),

        '/WebSocketPage':(context)=>WebSocketPage(),

        '/DataShardPage':(context)=>DataShardPage(),

      };

      //优化后
      // ignore: strong_mode_top_level_function_literal_block, top_level_function_literal_block
      var onGenerateRoute=(RouteSettings settings) {
        // 统一处理
        final String name = settings.name;

        final Function pageContentBuilder = routes[name];

        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          }else{
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context));
            return route;
          }
        }
      };