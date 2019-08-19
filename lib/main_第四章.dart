    import 'package:flutter/material.dart';

    void main() => runApp(MyApp());

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return new MaterialApp(
            home: new Scaffold(
          appBar: AppBar(
            title: Text("呆萌"),
          ),
          body: new Column(

            children: <Widget>[

              SizedBox(
                height: 30,
              ),
              MyStatelessWidget("BBB", "BBB"),
              SizedBox(
                height: 30,
              ),

              MyStatelessWidget("CCC", "CCC"),
              SizedBox(
                height: 30,
              ),
              MyStatelessWidget("DDD", "DDD"),
              SizedBox(
                height: 30,
              ),

              MyStatefulWidget(),
            ],
          ),
        ));
      }
    }

    class MyStatefulWidget extends StatefulWidget {
      @override
      State<StatefulWidget> createState() {
        print("--------> MyStatefulWidget: build");
        return MyState();
      }
    }
    class MyState extends State<MyStatefulWidget> {
      int index = 0;
      @override
      Widget build(BuildContext context) {
        print("-------->MyState  build");
        return Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[

              MyStatelessWidget("AAA", "AAA:" + index.toString()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index++;
                  });
                },
                child: TextWidget("点击测试"),
              )
            ],
          ),
        );
      }
    }

    class MyStatelessWidget extends StatelessWidget {
      final String _text;
      final String _name;

      MyStatelessWidget(this._name, this._text) {
        print("---------> MyStatelessWidget:" + _name + "  构造");
      }

      @override
      Widget build(BuildContext context) {
        print("---------> MyStatelessWidget:" + _name + "  build");
        if (_name == "DDD") {
          print("模拟一个耗时操作开始");
          for (int i = 0; i < 10; i++) {
            print("for:" + i.toString());
          }
          print("模拟一个耗时操作结束");
        }
        return TextWidget(_text);
      }
    }

    class TextWidget extends StatelessWidget {
      final String _text;
      TextWidget(this._text);

      @override
      Widget build(BuildContext context) {
        return Text(
          _text,
          style: TextStyle(fontSize: 20, color: Colors.deepPurple, wordSpacing: 10),
        );
      }
    }
