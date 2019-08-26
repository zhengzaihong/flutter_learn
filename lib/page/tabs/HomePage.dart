    import 'package:flutter/foundation.dart';
    import 'package:flutter/material.dart';

    class HomePage extends StatefulWidget {
      HomePage({Key key}) : super(key: key);

      HomePageState createState() => HomePageState();
    }

    class HomePageState extends State<HomePage> {
      void handlerDrawerButton() {

      }
      @override
      Widget build(BuildContext context) {

        return Scaffold(

          backgroundColor: Colors.blue,

          body: Container(
            child: Center(
              child: Text("主页"),
            ),
          ),
        );
      }
    }





