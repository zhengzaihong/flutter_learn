      import 'package:flutter/material.dart';

      class ScrollerViewPage extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
      //          return MaterialApp(
      //              debugShowCheckedModeBanner: false,
      //              home: Scaffold(
      //                  appBar: AppBar(
      //                    title: Text("ScrollerViewPage"),
      //                  ),
      //                  body: Container(
      //                      child: SingleChildScrollView(
      //                          reverse: false,
      //                          child: SingleChildScrollViewDemo()))));

          return CustomScrollViewDemo();
        }
      }



      class CustomScrollViewDemo extends StatelessWidget {

        @override
        Widget build(BuildContext context) {
          return Material(
              child: ScrollListenerDemo()
          );
        }
      }

      class ScrollListenerDemo extends StatefulWidget {
        @override
        _ScrollListenerDemoState createState() => _ScrollListenerDemoState();
      }

      class _ScrollListenerDemoState extends State<ScrollListenerDemo> {

        ScrollController _controller = new ScrollController();
        //是否显示“返回到顶部”按钮
        bool showToTopBtn = true;

        @override
        void initState() {
          //监听滚动事件，打印滚动位置
          _controller.addListener(() {
            print(_controller.offset); //打印滚动位置
            if (_controller.offset < 500 && showToTopBtn) {
              setState(() {
                showToTopBtn = false;
              });
            } else if (_controller.offset >= 500 && showToTopBtn == false) {
              setState(() {
                showToTopBtn = true;
              });
            }
          });
        }

        @override
        void dispose() {
          //为了避免内存泄露，需要调用_controller.dispose
          _controller.dispose();
          super.dispose();
        }

        @override
        Widget build(BuildContext context) {
          return Scaffold(

              floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.arrow_upward),
                  onPressed: () {
                    //返回到顶部时执行动画
                    _controller.animateTo(0.0,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeInBack
                    );
                  }
              ),

            body: CustomScrollView(
              controller: _controller,
              slivers: <Widget>[
                //AppBar，包含一个导航栏
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('ScrollerViewPage'),
                    //centerTitle: true,
                    background: Image.asset(
                      "images/mm.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    //Grid
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //Grid按两列显示
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 4.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        //创建子widget
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.red[100 * ((index + 2) % 9)],
                          child: Text('grid item $index'),
                        );
                      },
                      childCount: 20,
                    ),
                  ),
                ),
                //List
                SliverFixedExtentList(
                  itemExtent: 50.0,
                  delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        //创建列表项
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue[100 * ((index + 2) % 9)],
                          child: Text('list item $index'),
                        );
                      }, childCount: 50 //50个列表项
                  ),
                ),
              ],
            )
          );
        }
      }


      class SingleChildScrollViewDemo extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          List<Widget> listWidget = new List();

          for (int i = 0; i < 40; i++) {
            var text = Text("Item$i",
                style: TextStyle(fontSize: 16, color: Colors.redAccent));
            listWidget.add(text);
            listWidget.add(Divider());
          }
          return Column(children: listWidget);
        }
      }
