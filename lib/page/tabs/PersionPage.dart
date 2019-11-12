      import 'package:flutter/material.dart';

      class PersionPage extends StatefulWidget {
        PersionPage({Key key}) : super(key: key);

        _PersionPageState createState() => _PersionPageState();
      }

      class _PersionPageState extends State<PersionPage> {
        @override
        Widget build(BuildContext context) {
          return Container(
            color: Colors.blue,
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 30),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5),
                  RaisedButton(
                    color: Colors.deepPurple,
                    elevation: 5,
                    focusElevation: 40,
                    child: Text('常用Button', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/RaisedButtonPage");
                    },
                  ),
                  SizedBox(height: 5),

                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('常用表单组件', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/FormPagePage");
                    },
                  ),


                  SizedBox(height: 5),

                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('ScrollerView', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/ScrollerViewPage");

                    },
                  ),

                  SizedBox(height: 5),

                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('Dialog', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/DialogPage");

                    },
                  ),
                  SizedBox(height: 5),

                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('Sp和读写文件方式持久化', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/PersistenPage");
                    },
                  ),

                  SizedBox(height: 5),

                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('数据库', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/DataBasePage");
                    },
                  ),
                  SizedBox(height: 5),

                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('Pop弹窗', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/PopViewPage");
                    },
                  ),

                  SizedBox(height: 5),
                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('时间picker', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/TimePickerPage");
                    },
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('WebView', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/WebViewPage");
                    },
                  ),


                  SizedBox(height: 5),
                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('IsolatePage', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/IsolatePage");
                    },
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('WebSocketPage', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/WebSocketPage");
                    },
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    elevation: 5,
                    color: Colors.deepPurple,
                    focusElevation: 40,
                    child: Text('数据共享', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/DataShardPage");
                    },
                  ),
                ],
              ),
            )
          );
        }
      }
