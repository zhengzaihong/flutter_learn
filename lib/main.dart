      import 'package:flutter/material.dart';
      import 'package:flutter_learn/util/Global.dart';
      import 'package:flutter_localizations/flutter_localizations.dart';
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

              //国际化配置
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                //配置语种
                const Locale('zh', 'CH'),
                const Locale('en', 'US'),
              ],

              //去掉debug图标
              debugShowCheckedModeBanner:false ,

              //初始化的时候加载的路由
              initialRoute: '/',
              onGenerateRoute: onGenerateRoute

          );
        }
      }
