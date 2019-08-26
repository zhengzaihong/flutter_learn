    import 'package:flutter/material.dart';
    import 'AutoDrawer.dart';


    class WithListenerDrawer extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return AutoDrawer(
            callback: (value){
              print(value);
            },
            child: Container(
              //加个背景
              color: Colors.deepPurpleAccent,

              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    // 更多自定义样式就在这里 DIY 吧
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.build, color: Colors.deepOrange,
                              ),
                              SizedBox(width: 10),
                              Text("红红", style: TextStyle(color: Colors.deepOrange, fontSize: 22)),
                            ],
                          ),
                        ],
                      ),

                      //设置背景
                      decoration: BoxDecoration(
                          //color: Colors.yellow,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/awhcrop%3D200%2C200/sign=a13391550fe939014048d06d098324da/4b90f603738da977e4f8af5ebe51f8198718e3f4.jpg"),
                              fit: BoxFit.cover))),

                  ListTile(
                    title: Text('QQ会员',
                        style: TextStyle(color: Colors.blue, fontSize: 18)),
                    //CircleAvatar 一般用于设置圆形头像
                    leading: CircleAvatar(
                      child: Icon(Icons.question_answer),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('我的相册',
                        style: TextStyle(color: Colors.blue, fontSize: 18)),
                    leading: CircleAvatar(child: Icon(Icons.people)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('我的文件',
                        style: TextStyle(color: Colors.blue, fontSize: 18)),
                    leading: CircleAvatar(
                      child: Icon(Icons.list),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
        );
      }
    }

