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
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.deepPurple,
                  elevation: 20,
                  focusElevation: 40,
                  child: Text('常用Button', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/RaisedButtonPage");
                  },
                ),
                SizedBox(height: 10),

                RaisedButton(
                  elevation: 20,
                  color: Colors.deepPurple,
                  focusElevation: 40,
                  child: Text('常用表单组件', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/FormPagePage");

                  },
                ),


                SizedBox(height: 10),

                RaisedButton(
                  elevation: 20,
                  color: Colors.deepPurple,
                  focusElevation: 40,
                  child: Text('ScrollerView', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/ScrollerViewPage");

                  },
                ),

                SizedBox(height: 10),

                RaisedButton(
                  elevation: 20,
                  color: Colors.deepPurple,
                  focusElevation: 40,
                  child: Text('Dialog', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/DialogPage");

                  },
                ),
                SizedBox(height: 10),

                RaisedButton(
                  elevation: 20,
                  color: Colors.deepPurple,
                  focusElevation: 40,
                  child: Text('数据持久化', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/PersistenPage");

                  },
                ),
              ],
            ),
          );
        }
      }
