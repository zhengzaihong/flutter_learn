      import 'package:flutter/material.dart';
      import 'package:flutter_learn/route/Routes.dart';

      void main() => runApp(MyApp());

      class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return new MaterialApp(
              home: new Scaffold(
                  appBar: AppBar(
                    title: Text("呆萌"),
                  ),
                  body: HomePage()
              ),

               //initialRoute: '/', //初始化的时候加载的路由
               onGenerateRoute: onGenerateRoute);
        }
      }

      class HomePage extends StatefulWidget {
        HomePage({Key key}) : super(key: key);

        _HomePageState createState() => _HomePageState();
      }

      class _HomePageState extends State<HomePage> {
        @override
        Widget build(BuildContext context) {
          return Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                    child: Text("跳转到第二个界面"),
                    onPressed: () {
                      //命名路由跳转 并传值
                      Navigator.pushNamed(context, '/SecondPage',arguments: {
                        "key":"哎呦，你来啦O(∩_∩)O"
                      }).then((value){
                        print(value);
                      });
                    },
                    color: Theme.of(context).accentColor,
                    textTheme: ButtonTextTheme.primary),
              ],
            ),
          );
        }
      }
