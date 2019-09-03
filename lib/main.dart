      import 'package:flutter/material.dart';
      import 'package:flutter_learn/util/Global.dart';
      import 'route/Routes.dart';


      void main(){

        runApp(MyApp());

        //初始化 sp
        Global.initPreferences();

        //初始化文件
        Global.initFile();
      }

      class MyApp extends StatelessWidget {

        @override
        Widget build(BuildContext context) {

          return MaterialApp(

              //去掉debug图标
              debugShowCheckedModeBanner:false ,

              //初始化的时候加载的路由
              initialRoute: '/',
              onGenerateRoute: onGenerateRoute

          );
        }
      }
