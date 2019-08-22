      import 'package:flutter/material.dart';

      class TabBarControllerPage extends StatefulWidget {
        TabBarControllerPage({Key key}) : super(key: key);

        _TabBarControllerPageState createState() => _TabBarControllerPageState();
      }

      class _TabBarControllerPageState extends State<TabBarControllerPage>
          with SingleTickerProviderStateMixin {

        TabController _tabController;

        @override
        void dispose() {
          super.dispose();
          //在组件树中移除是销毁_tabController
          _tabController.dispose();
        }

        @override
        void initState() {
          super.initState();

          _tabController = new TabController(vsync: this, length: 4);

          //监听点击事件的回调
          _tabController.addListener(() {

            print( getView()[_tabController.index].key.toString());

          });
        }

        List<Widget> getView() {

          List<Widget> viewWidget = new List();

          //配置下key 方便日子看出 是否回调了 对应的菜单

          Tab tab = Tab(key: Key("video"), text: "视频");
          Tab tab1 = Tab(key: Key("Duan Zi"), text: "段子");
          Tab tab2 = Tab(key: Key("Pic"), text: "趣图");
          Tab tab3 = Tab(key: Key("Test"), text: "测试");

          viewWidget.add(tab);
          viewWidget.add(tab1);
          viewWidget.add(tab2);
          viewWidget.add(tab3);

          return viewWidget;
        }

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("呆萌"),
              bottom: TabBar(

                  //根据你的场景进行配置
                  // isScrollable: true,

                  //指示器颜色
                  indicatorColor: Colors.red,

                  //设置选中菜单文字颜色
                  labelColor: Colors.white,
                  //未选中文字菜单的颜色
                  unselectedLabelColor: Colors.yellowAccent,

                  //使得 TabBar 和 TabBarView之间进行关联，需要同时配置该对象 _tabController
                  controller: this._tabController,
                  tabs: getView()),
            ),
            body: TabBarView(

              controller: this._tabController,
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
                ),
                Container(
                  child: Center(
                    child: Text("测试专区"),
                  ),
                ),
              ],
            ),
          );
        }
      }
