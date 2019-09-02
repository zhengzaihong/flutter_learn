      import 'package:flutter/material.dart';
      import 'package:flutter_learn/util/UserHelper.dart';
      import 'route/Routes.dart';


      void main(){

        var userHelper = UserHelper();
        var userHelper1 = UserHelper();
        var userHelper2 =  UserHelper.instance;

        print("------------> 对象：'${userHelper.hashCode} 相等  '+${identical(userHelper, userHelper1)}"); //true
        print("------------> 对象：'${userHelper1.hashCode} 相等  '+${identical(userHelper, userHelper2)}"); //true
        print("------------> 对象：'${userHelper2.hashCode} 相等  '+${identical(userHelper1, userHelper2)}"); //true

       // runApp(MyApp());
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
