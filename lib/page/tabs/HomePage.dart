      import 'package:flutter/material.dart';

      class HomePage extends StatefulWidget {
        HomePage({Key key}) : super(key: key);

        _HomePageState createState() => _HomePageState();
      }

      class _HomePageState extends State<HomePage> {


        @override
        Widget build(BuildContext context) {
          return Scaffold(

            backgroundColor: Colors.blue,
            body: Container(child:Center(child:  Text("主页",)),),

            drawer: Drawer(
              child: Text('左侧边栏',style: TextStyle(color: Colors.red,fontSize: 22),),
            ),

            endDrawer: Drawer(
              child: Text('右侧侧边栏',style: TextStyle(color: Colors.red,fontSize: 22),),
            ),
          );
        }
      }