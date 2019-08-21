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
            child: Center(child: Text("个人中心"),),
          );
        }
      }