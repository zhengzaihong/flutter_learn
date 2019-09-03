      import 'dart:io';

      import 'package:flutter/material.dart';
      import 'package:flutter_learn/util/Global.dart';
      import 'package:flutter_learn/util/ToastUtil.dart';
      import 'package:shared_preferences/shared_preferences.dart';

      //使用初始化好的静态资源
      SharedPreferences sharedPreferences = Global.preferences;

      //使用初始化好的本地文件
      File localFile = Global.file;

      class PersistenPage extends StatefulWidget {
        PersistenPage({Key key}) : super(key: key);

        _PersistenPageState createState() => _PersistenPageState();
      }

      class _PersistenPageState extends State<PersistenPage> {
        @override
        Widget build(BuildContext context) {

          return Scaffold(
              appBar: AppBar(
                title: Text("持久化"),
              ),
              body: SingleChildScrollView(
                child: Container(
                    color: Colors.blue,
                    height: 1000,
                    child: Column(
                      children: <Widget>[

                        shardPreferences(),

                        IoReadWirte()
                      ],
                    ),
                ),
              ));
        }


        //文件的读写
        Widget IoReadWirte(){
          //定义一个内存级别的变量
          String info = localFile.readAsStringSync();
          int count =int.parse(info??0);
          return Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text('文件操作方式持久化',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              Text("当前累计数据：$count"),
              Row(
                children: <Widget>[
                  SizedBox(width: 5),
                  RaisedButton(
                    color: Colors.deepPurple,
                    elevation: 20,
                    focusElevation: 40,
                    child: Text('自增', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        count++;
                        localFile.writeAsStringSync(count.toString());

                      });
                    },
                  ),
                  SizedBox(width: 5),
                  RaisedButton(
                    color: Colors.deepPurple,
                    elevation: 20,
                    focusElevation: 40,
                    child: Text('自减', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        count--;
                        localFile.writeAsStringSync(count.toString());
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          );

        }


        //SP 文件读写
        Widget shardPreferences(){
          //定义一个内存级别的变量
          int count = sharedPreferences.getInt("count") == null
              ? 0
              : sharedPreferences.getInt("count");
          return Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text('ShardPreferences方式持久化',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              Text("当前累计数据：$count"),
              Row(
                children: <Widget>[
                  SizedBox(width: 5),
                  RaisedButton(
                    color: Colors.deepPurple,
                    elevation: 20,
                    focusElevation: 40,
                    child: Text('自增', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        count++;
                        sharedPreferences?.setInt("count", count);
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  RaisedButton(
                    color: Colors.deepPurple,
                    elevation: 20,
                    focusElevation: 40,
                    child: Text('清除', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        count = 0;
                        sharedPreferences.clear();
                        // sharedPreferences.remove("count");
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  RaisedButton(
                    color: Colors.deepPurple,
                    elevation: 20,
                    focusElevation: 40,
                    child: Text('是否包含', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        count = 0;
                        bool flag =  sharedPreferences.containsKey("count");
                        ToastUtil.show("是否包含： $flag");
                      });
                    },
                  ),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(height: 10),
            ],
          );
        }

      }
