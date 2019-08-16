    import 'package:flutter/material.dart';

    void main() => runApp(MyApp());

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return new MaterialApp(
          home: new Scaffold(
              appBar: AppBar(
                title: Text("呆萌"),
              ),
              body: ViewLayout()),
        );
      }
    }

    class ViewLayout extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return ListView(
          children: <Widget>[
            Text(
              "这是Stack的简单应用",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),

            SizedBox(
              height: 5,
            ),
            //用容器包装下设置背景色 方便观察
            Container(
              color: Colors.deepPurple,
              height: 60,
              child: Stack(
                alignment: Alignment(-1, -1), // 将子元素定位在左上，或者使用常量 topLeft
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.red,
                  ),
                  Text('你说什么？', style: TextStyle(fontSize: 16, color: Colors.white))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "这是Stack结合Align的应用",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 100,
              width: 300,
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(1, 0), //定位最右边，垂直居中
                    child: Icon(Icons.home, size: 30, color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.center, //定位在容器的中心位置
                    child: Icon(Icons.search, size: 30, color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft, //定位在容器的左下
                    child: Icon(Icons.ac_unit, size: 30, color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "这是Stack结合Positioned的应用",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(
              height: 5,
            ),

            //用容器包装下设置背景色 方便观察
            Container(
              color: Colors.deepPurple,
              height: 60,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 10, // 让子元素从右边开始对齐
                    width: 120, //指定宽度为120个单位
                    child: Icon(Icons.access_alarm, size: 30, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0, // 让子元素从底部开始对齐
                    left: 100,
                    height: 50,
                    child: Icon(Icons.memory, size: 30, color: Colors.white),
                  ),
                  Positioned(
                    left: 5, // 让子元素从左边开始对齐
                    width: 150,
                    child: Text('你很帅，你造吗？',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "这是Card应用",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(
              height: 5,
            ),

            Card(
              margin: EdgeInsets.all(5),
              color: Colors.cyan,
              elevation: 10,
              //10个单位的阴影
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0))),
              //设置圆角
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Mr.Z", style: TextStyle(fontSize: 18)),
                    subtitle: Text("工程师", style: TextStyle(fontSize: 14)),
                  ),
                  ListTile(
                    title: Text("电话：xxxxx"),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),
            Text(
              "这是AspectRatio应用",
              style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
            ),
            SizedBox(
              height: 5,
            ),

            Container(
                width: 100,
                child: AspectRatio(
                  aspectRatio: 3.0 / 1.0,
                  child: Container(
                    color: Colors.red,
                  ),
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              "这是Wrap应用",
              style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
            ),
            SizedBox(
              height: 5,
            ),
            Wrap(
               spacing: 10,
               runSpacing: 10,
               direction: Axis.horizontal,
               alignment:WrapAlignment.spaceEvenly,
               children: <Widget>[
                ButtonItem("盗墓笔记"),
                ButtonItem("鬼吹灯"),
                ButtonItem("桃花怪大战菊花侠"),
                ButtonItem("无主之城"),
                ButtonItem("琅琊榜"),
                ButtonItem("仙剑奇侠传"),
                ButtonItem("风云决"),
                ButtonItem("哪吒"),
                ButtonItem("玄门大师"),
                ButtonItem("废材兄弟"),
                ButtonItem("爱情公寓"),
              ],
            )
          ],
        );
      }
    }

    //封装一个简单的Button 方便调度
    class ButtonItem extends StatelessWidget {
      final String text;

      const ButtonItem(this.text, {Key key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return RaisedButton(
            child: Text(this.text,style: TextStyle(color: Colors.red),),
            textColor: Theme.of(context).cardColor,
            onPressed: () {});
      }
    }
