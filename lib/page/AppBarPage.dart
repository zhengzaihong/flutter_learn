      import 'package:flutter/material.dart';

      class AppBarPage extends StatelessWidget {
        @override
        Widget build(BuildContext context) {

          return MaterialApp(

            home: DefaultTabController(
              //这个一定的和tabs的子元素大小一致
              length: 3,

              child: Scaffold(
                appBar: AppBar(
                  //标题
                  title: Text("呆萌"),
                  //设置Bar背景色
                  backgroundColor: Colors.red,
                  //标题居中
                  centerTitle: true,

                  bottom: TabBar(

                    //配置指示器颜色
                    indicatorColor: Colors.green,
                    //让指示器和文字等宽
                    indicatorSize: TabBarIndicatorSize.label,
                    // 导航Tab
                    tabs: <Widget>[
                      Tab(text: "视频"),
                      Tab(text: "段子"),
                      Tab(text: "趣图"),
//                      Tab(text: "趣图"),
//                      Tab(text: "趣图"),
//                      Tab(text: "趣图"),
//                      Tab(text: "趣图"),
//                      Tab(text: "趣图"),
//                      Tab(text: "趣图"),
                    ],
                  ),

                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: new Text('点击了左侧按钮')));
                        },
                      );
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                body: TabBarView(

                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Text("视频专区"),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("段子专区"),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("趣图专区"),
                      ),
                    )

//                    ,
//                    Container(
//                      child: Center(
//                        child: Text("趣图专区"),
//                      ),
//                    ),
//                    Container(
//                      child: Center(
//                        child: Text("趣图专区"),
//                      ),
//                    ),
//                    Container(
//                      child: Center(
//                        child: Text("趣图专区"),
//                      ),
//                    ),
//                    Container(
//                      child: Center(
//                        child: Text("趣图专区"),
//                      ),
//                    ),
//                    Container(
//                      child: Center(
//                        child: Text("趣图专区"),
//                      ),
//                    ),
//                    Container(
//                      child: Center(
//                        child: Text("趣图专区"),
//                      ),
//                    )
                  ],
                ),
              ),
            ),

          );
        }
      }


