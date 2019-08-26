      import 'package:flutter/material.dart';
      import 'route/Routes.dart';


      void main() => runApp(MyApp());

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
