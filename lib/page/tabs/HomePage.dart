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
        appBar: AppBar(
          title: Text("呆萌"),
          leading:Builder(
            builder: (context) => IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: Text("主页"),
        ),
      ),
     // drawer: LeftDrawerUserAccountsDrawerHeader(),
     // drawer: LeftDrawerHeader(),

      drawer: WithListenerDrawer(),
      endDrawer: Drawer(
        child: Text(
          '右侧侧边栏', style: TextStyle(color: Colors.blue, fontSize: 22),
        ),
      ),
    );
  }
}


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
                      color: Colors.yellow,
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




      class AutoDrawer extends StatefulWidget {

        final double elevation;
        final Widget child;
        final String semanticLabel;
        //定义显示宽度百分百比 默认60%
        final double widthPercent;
        final DrawerCallback callback;
         AutoDrawer({
          Key key,
          this.elevation = 16.0,
          this.child,
          this.semanticLabel,
          this.widthPercent = 0.6,
          this.callback,
        })  :super(key: key);
        @override
        _AutoDrawerState createState() => _AutoDrawerState();
      }

      class _AutoDrawerState extends State<AutoDrawer> {

        @override
        void initState() {
          if(widget.callback!=null){
            //打开侧边栏 触发
            widget.callback(true);
          }
          super.initState();
        }
        @override
        void dispose() {
          if(widget.callback!=null){
            // 关闭侧边栏触发
            widget.callback(false);
          }
          super.dispose();
        }

        @override
        Widget build(BuildContext context) {
          assert(debugCheckHasMaterialLocalizations(context));
          String label = widget.semanticLabel;
          switch (defaultTargetPlatform) {
            case TargetPlatform.iOS:
              label = widget.semanticLabel;
              break;
            case TargetPlatform.android:
            case TargetPlatform.fuchsia:
              label = widget.semanticLabel ?? MaterialLocalizations.of(context)?.drawerLabel;
          }
          final double _width = MediaQuery.of(context).size.width * widget.widthPercent;
          return Semantics(
            scopesRoute: true,
            namesRoute: true,
            explicitChildNodes: true,
            label: label,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(width: _width),
              child: Material(
                elevation: widget.elevation,
                child: widget.child,
              ),
            ),
          );
        }
      }








class LeftDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                        Icons.build,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(width: 10),
                      Text("红红",
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 22)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.select_all,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(width: 10),
                      Text("桐桐",
                          style: TextStyle(color: Colors.blue, fontSize: 18)),
                    ],
                  ),
                ],
              ),

              //设置背景
              decoration: BoxDecoration(
                  color: Colors.yellow,
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
    ));
  }
}

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
