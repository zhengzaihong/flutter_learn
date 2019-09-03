      import 'package:flutter/material.dart';
      import 'package:flutter_learn/page/AppBarPage.dart';
      import 'package:flutter_learn/page/SecondPage.dart';
      import 'package:flutter_learn/page/TabBarControllerPage.dart';
      import 'package:flutter_learn/page/Tabs.dart';
      import 'package:flutter_learn/page/button/RaisedButtonPage.dart';
      import 'package:flutter_learn/page/dialog/DialogPage.dart';
      import 'package:flutter_learn/page/form/FormPage.dart';
      import 'package:flutter_learn/page/persistence/PersistenPage.dart';
      import 'package:flutter_learn/page/scrollview/ScrollerViewPage.dart';


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
      };

      //优化后
      // ignore: strong_mode_top_level_function_literal_block
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