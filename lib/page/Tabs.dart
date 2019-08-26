
      import 'package:flutter/material.dart';
      import 'package:flutter_learn/drawer/WithListenerDrawer.dart';

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
              body: this._pageList[this._currentIndex],

              floatingActionButton:Container(
                height: 80,
                width: 80,
                //实现一个圆形
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                //距离上边 10个单位
                margin: EdgeInsets.only(top:10),
                // 8个单位的内边距，让周边有浮出感
                padding: EdgeInsets.all(8),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: this._currentIndex==1?Colors.red:Colors.deepPurple,
                  onPressed: (){
                    setState(() {
                      this._currentIndex=1;
                    });
                  },
                ),
              ),
              //指定显示位置
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


            appBar: AppBar(
              title: Text("呆萌"),
              leading:Builder(
                builder: (context) => IconButton(
                  icon: new Icon(Icons.settings),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),

              // 第七章演示
              // drawer: LeftDrawerUserAccountsDrawerHeader(),
              // drawer: LeftDrawerHeader(),
            drawer: WithListenerDrawer(),
            endDrawer: Drawer(
              child: Text(
                '右侧侧边栏', style: TextStyle(color: Colors.blue, fontSize: 22),
              ),
            ),

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