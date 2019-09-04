    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter/services.dart';
    import 'package:flutter_learn/db/SqlUserHelper.dart';
    import 'package:flutter_learn/db/UserInfo.dart';

    class DataBasePage extends StatelessWidget {

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                appBar: AppBar(
                  title: Text("DataBasePage"),
                ),
                body: Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 500,
                  child: ListView(
                    children: <Widget>[
                      DataBasePageDemo()
                    ],
                  ),
                )));
      }
    }

    class DataBasePageDemo extends StatefulWidget {
      @override
      _DataBasePageDemoState createState() => _DataBasePageDemoState();
    }

    class _DataBasePageDemoState extends State<DataBasePageDemo> {

      TextEditingController _unameController = new TextEditingController();
      TextEditingController _pwdController = new TextEditingController();
      TextEditingController _ageController = new TextEditingController();

      GlobalKey _formKey = new GlobalKey<FormState>();

      SqlUserHelper sqlUserHelper =  SqlUserHelper.helperInstance();

      String userName = "";

      String userPass = "";

      int age = 0;

      @override
      void initState() {
        super.initState();

        //添加监听
        _unameController.addListener(() {
          userName = _unameController.text;
        });

        _pwdController.addListener(() {
          userPass = _pwdController.text;
        });

        _ageController.addListener(() {
          age = int.parse(_ageController.text);
        });
      }

      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: true,
                      controller: _unameController,
                      decoration: InputDecoration(
                          hintText: "请输入姓名",
                          icon: Icon(Icons.person)),
                      // 校验用户名
                      validator: (v) {
                        return v.trim().length > 0 ? null : "姓名不能为空";
                      }),
                  TextFormField(
                      controller: _pwdController,
                      decoration: InputDecoration(
                          hintText: "您的密码",
                          icon: Icon(Icons.lock)),
                      //校验密码
                      validator: (v) {
                        return v.trim().length > 0 ? null : "密码不能为空";
                      }),

                  TextFormField(
                      controller: _ageController,
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          hintText: "您的年龄",
                          icon: Icon(Icons.layers)),
                      //校验密码
                      validator: (v) {
                        return v.trim().length > 0 ? null : "密码不能为空";
                      }),
                  Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              RaisedButton(
                                padding: EdgeInsets.all(15.0),
                                child: Text("添加(insert)"),
                                color: Colors.blue,
                                textColor: Colors.white,
                                onPressed: () {
                                  FormState state = (_formKey.currentState as FormState);
                                  if (state.validate()) {
                                    //构建一个user 对象
                                    UserInfo user = UserInfo(name: userName,password: userPass,age: age);
                                    //向数据库插入该条数据
                                    sqlUserHelper.insert(user).then((value){
                                      print("the last insert id $value");
                                    });
                                  }
                                },
                              ),
                              SizedBox(width: 10,),
                              RaisedButton(
                                padding: EdgeInsets.all(15.0),
                                child: Text("添加(rawInsert)"),
                                color: Colors.blue,
                                textColor: Colors.white,
                                onPressed: () {
                                  FormState state = (_formKey.currentState as FormState);
                                  if (state.validate()) {

                                    //构建一个user 对象
                                    UserInfo user = UserInfo(name: userName,password: userPass,age: age);
                                    //向数据库插入该条数据
                                    sqlUserHelper.rawInsert(user).then((value){
                                      print("the last rawInsert id $value");
                                    });
                                  }
                                },
                              ),

                            ],
                          ),
                        ],
                      )

                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("查询(query)"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                FormState state = (_formKey.currentState as FormState);
                                if (state.validate()) {
                                  ///查询全部
                                  sqlUserHelper.query().then((value){
                                    print("the query info  ${value.toString()}");
                                  });
                                }
                              },
                            ),

                            SizedBox(width: 10,),
                            RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("查询(rawQuery)"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                FormState state = (_formKey.currentState as FormState);
                                if (state.validate()) {
                                  ///查询全部
                                  sqlUserHelper.rawQuery().then((value){
                                    print("the rawQuery info  ${value.toString()}");
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("修改(update)"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                FormState state = (_formKey.currentState as FormState);
                                if (state.validate()) {
                                  //构建一个user 对象
                                  UserInfo user = UserInfo(name: userName,password: userPass,age: age);
                                  sqlUserHelper.update(user, 1).then((value){
                                    print("the update info  ${value.toString()}");
                                  });
                                }
                              },
                            ),

                            SizedBox(width: 10,),
                            RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("修改(rawUpdate)"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                FormState state = (_formKey.currentState as FormState);
                                if (state.validate()) {
                                  UserInfo user = UserInfo(name: userName,password: userPass,age: age);
                                  sqlUserHelper.rawUpdate(user, 1).then((value){
                                    print("the rawQuery info  ${value.toString()}");
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("删除(delete)"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                FormState state = (_formKey.currentState as FormState);
                                if (state.validate()) {
                                  /// 根据 id 删除
                                  sqlUserHelper.delete(1).then((value){
                                    print("the delete info  ${value.toString()}");
                                  });
                                }
                              },
                            ),

                            SizedBox(width: 10,),
                            RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("删除(rawDelete)"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                FormState state = (_formKey.currentState as FormState);
                                if (state.validate()) {
                                  /// 根据 id 删除
                                  sqlUserHelper.rawDelete( 1).then((value){
                                    print("the rawDelete info  ${value.toString()}");
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        );
      }
    }
