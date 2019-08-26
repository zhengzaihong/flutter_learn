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

                RaisedButton(
                  elevation: 20,
                  focusElevation: 40,
                  child: Text('RaisedButton'),
                  onPressed: () {
                    //跳转 RaisedButtonPage 界面
                    Navigator.pushNamed(context,"/RaisedButtonPage");
                  },
                ),
                SizedBox(height: 10)
              ],

            ),
          );
        }
      }