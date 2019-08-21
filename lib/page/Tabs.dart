
      import 'package:flutter/material.dart';

      //引入准备好的界面
      import 'tabs/CommunityPage.dart';
      import 'tabs/PersionPage.dart';
      import 'tabs/HomePage.dart';



      class Tabs extends StatefulWidget {

        _TabsState createState() => _TabsState();

      }

      class _TabsState extends State<Tabs> {

        //默认选中的索引
        int _currentIndex=0;

        //将页面封装在集合中，方便通过索引取出
        List _pageList=[
          HomePage(),
          CommunityPage(),
          PersionPage(),
        ];


        @override
        Widget build(BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text("呆萌"),
              ),
              body: this._pageList[this._currentIndex],

              bottomNavigationBar: BottomNavigationBar(

                //配置选中的索引值
                currentIndex: this._currentIndex,

                onTap: (int index){

                  //改变状态
                    setState(() {
                        this._currentIndex=index;
                    });
                },

                //icon的大小
                iconSize:36.0,

                //选中的颜色
                fixedColor:Colors.red,

                selectedFontSize: 18,

                selectedLabelStyle: TextStyle(color: Colors.red),

                // selectedItemColor: Colors.red, 和 fixedColor互斥

                unselectedFontSize: 18,

                unselectedItemColor:Colors.deepPurple ,

                unselectedLabelStyle: TextStyle(color: Colors.deepPurple),

                showUnselectedLabels: true,

                //配置底部tabs为固定效果，即没有点击后的凸出感
                type:BottomNavigationBarType.fixed,

                // BottomNavigationBarItem 包装的底部按钮
                items: [

                  BottomNavigationBarItem(

                    icon: Icon(Icons.home),
                    title: Text("首页")

                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Icons.question_answer),
                    title: Text("社区")
                  ),

                   BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    title: Text("个人中心")
                  )
                ],
              ),
            );
        }
      }