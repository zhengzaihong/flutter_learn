import 'package:flutter/material.dart';

import 'page/SecondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: AppBar(
              title: Text("呆萌"),
            ),
            body: HomePage()));
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
                //路由跳转
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
              child: Text("传值跳转到第二个界面"),
              onPressed: () {
                //通过构造函数传值
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(value: "----->传值跳转",)),
                );
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary),
        ],
      ),
    );
  }
}
