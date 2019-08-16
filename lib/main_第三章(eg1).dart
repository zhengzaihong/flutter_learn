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
            "这是Paddiing的简单应用",
            style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
          ),

          SizedBox(
            height: 10,
          ),
          //用容器包装下 方便观察
          Container(
            color: Colors.deepPurple,
            height: 60,
            child: Padding(
              //可以通过fromLTRB分别设置左上右下的内距，也可以用all统一设置
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image.network(
                  'http://qukufile2.qianqian.com/data2/pic/246708144/246708144.jpg',
                  fit: BoxFit.fitHeight),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "这是Row应用(横向布局)",
            style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //spaceEvenly 主轴的排列方式最为常见
            crossAxisAlignment: CrossAxisAlignment.start,
            //用的比较少
            children: <Widget>[
              IconWidget(Icons.search, color: Colors.blue),
              IconWidget(Icons.home, color: Colors.orange),
              IconWidget(Icons.select_all, color: Colors.red),
            ],
          ),

          SizedBox(
            height: 5,
          ),
          Text(
            "这是Column应用(垂直布局)",
            style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //spaceEvenly 主轴的排列方式最为常见
            crossAxisAlignment: CrossAxisAlignment.center,
            //用的比较少
            children: <Widget>[
              IconWidget(Icons.search, color: Colors.blue),
              SizedBox(
                height: 5,
              ),
              IconWidget(Icons.home, color: Colors.orange),
              SizedBox(
                height: 5,
              ),
              IconWidget(Icons.select_all, color: Colors.red),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "这是Expanded应用权重(1:2:1)",
            style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
          ),
          SizedBox(
            height: 5,
          ),

          Row(
            children: <Widget>[
              Expanded(
                  flex: 1, child: IconWidget(Icons.search, color: Colors.blue)),
              Expanded(
                flex: 2,
                child: IconWidget(Icons.home, color: Colors.orange),
              ),
              Expanded(
                flex: 1,
                child: IconWidget(Icons.select_all, color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "这是Expanded应用权重(1:2)",
            style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
          ),
          SizedBox(
            height: 10,
          ),

          Row(
            children: <Widget>[
              Expanded(
                  flex: 1, child: IconWidget(Icons.search, color: Colors.blue)),
              Expanded(
                flex: 2,
                child: IconWidget(Icons.home, color: Colors.orange),
              ),
            ],
          ),
        ],
      );
    }
  }

  //封装一个简单的Icon 方便调度
  class IconWidget extends StatelessWidget {
    double size = 32.0;
    Color color = Colors.red;
    IconData icon;

    IconWidget(this.icon, {this.color, this.size});

    @override
    Widget build(BuildContext context) {
      return Container(
        height: 50.0,
        width: 50.0,
        color: this.color,
        child:
        Center(child: Icon(this.icon, size: this.size, color: Colors.white)),
      );
    }
  }