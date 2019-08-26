    import 'package:flutter/material.dart';

    class LeftDrawerUserAccountsDrawerHeader extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Drawer(
            child: Container(
          //加个背景
          color: Colors.deepPurpleAccent,

          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("红红",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 18)),
                accountEmail: Text("1096877329@qq.com",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 18)),
                //账户头像
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://upload.jianshu.io/users/upload_avatars/3030564/2789e9ea-9856-456f-be2a-e00ed5992c26.png?imageMogr2/auto-orient/strip|imageView2/1/w/120/h/120"),
                ),

                //配置背景
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/awhcrop%3D200%2C200/sign=a13391550fe939014048d06d098324da/4b90f603738da977e4f8af5ebe51f8198718e3f4.jpg"),
                        fit: BoxFit.cover)),

                //配置其他
                otherAccountsPictures: <Widget>[
                  Text("其他内容",
                      style: TextStyle(color: Colors.lightBlue, fontSize: 10))
                ],
              ),
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
        ));
      }
    }
