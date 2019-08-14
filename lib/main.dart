    import 'package:flutter/material.dart';

    import 'res/TestData.dart';

    void main() => runApp(MyApp());

    bool isGrid = false;

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return new MaterialApp(
          home: new ViewStatefulWidget(),
        );
      }
    }

    //自定义Widget 实现有状态StatefulWidget
    class ViewStatefulWidget extends StatefulWidget {
      @override
      State<StatefulWidget> createState() {
        return HomeContent();
      }
    }

    class HomeContent extends State<ViewStatefulWidget> {
      void changeView() {
        // 通过 setState() 更新数据,组件树自动刷新
        setState(() {
          if (isGrid) {
            isGrid = false;
          } else {
            isGrid = true;
          }
        });
      }

      List<Widget> _getListData() {
        var tempList = musicData.map((value) {
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Image.network(value["url"],
                    width: 110, height: 100, fit: BoxFit.fitWidth),
                SizedBox(height: 10),
                Text(value["author"],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
            //绘制圆角背景
            decoration: BoxDecoration(
                //圆角10个单位
                borderRadius: BorderRadius.all(Radius.circular(10)),
                //背景色
                color: Colors.deepPurple,
                //绘制边框
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 1.0,
                )),
          );
        });
        return tempList.toList();
      }

      //通过循环添加
      List<Widget> _getData() {
        List<Widget> list = new List();

        for (var i = 0; i < musicData.length; i++) {
          list.add(
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(musicData[i]["music"]), //设置标题文本内容
                  leading: Image.network(musicData[i]["url"]), //在文本前显示网络图片
                  subtitle: Text(musicData[i]["author"]), // 设置二级标题
                ),
                //添加一条分割线
                new Container(
                  color: Colors.black12,
                  height: 1,
                )
              ],
            ),
          );
        }
        return list;
      }

      // 根据状态返回不同的Widget
      Widget getWidget() {
        if (isGrid) {
          return ListView(
            children: this._getData(),
          );
        } else {
          return GridView.count(
            //水平子 Widget 之间间距
            crossAxisSpacing: 10.0,
            //垂直子 Widget 之间间距
            mainAxisSpacing: 10.0,
            padding: EdgeInsets.all(10),
            //一行的 Widget 数量
            crossAxisCount: 2,
            //宽度和高度的比例
            // childAspectRatio:0.7,

            children: this._getListData(),
          );
        }
      }

      @override
      Widget build(BuildContext context) {
        return new Container(
          child: new Scaffold(
              appBar: AppBar(
                title: Text("呆萌"),
                 backgroundColor: Colors.red, //appBar 背景色
                 centerTitle: true, //标题居中显示
                 actions: <Widget>[
                  IconButton(

                    icon: Icon(Icons.menu),
                    onPressed: () { //添加按下事件
                      changeView();
                    },
                  )
                ],
              ),
              body: new Container(
                child: getWidget(),
              )),
        );
      }
    }
