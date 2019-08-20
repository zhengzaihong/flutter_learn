
import 'package:flutter/material.dart';
import 'package:flutter_learn/page/tabs/CommunityPage.dart';
import 'package:flutter_learn/page/tabs/PersionPage.dart';

import 'tabs/HomePage.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentIndex=0;

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

          currentIndex: this._currentIndex,   //配置对应的索引值选中

          onTap: (int index){

              setState(() {  //改变状态
                  this._currentIndex=index;
              });
          },

          iconSize:36.0,      //icon的大小


          fixedColor:Colors.red,  //选中的颜色

          selectedFontSize: 18,

          selectedLabelStyle: TextStyle(color: Colors.red),

//          selectedItemColor: Colors.red, 和 fixedColor互斥

          unselectedFontSize: 18,

          unselectedItemColor:Colors.deepPurple ,

          unselectedLabelStyle: TextStyle(color: Colors.deepPurple),

          showUnselectedLabels: true,

          type:BottomNavigationBarType.fixed,   //配置底部tabs可以有多个按钮
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