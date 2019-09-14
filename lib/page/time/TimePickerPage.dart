import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TimePickerPage extends StatefulWidget {
  TimePickerPage({Key key}) : super(key: key);

  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  DateTime _nowDate = DateTime.now();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _nowDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        this._nowDate = value;
      });
    });
  }

      //设置一个指定时间
      var _nowTime = TimeOfDay(hour: 16, minute: 45);

      _showTimePicker() {
        showTimePicker(
            context: context,
            //初始化时间到指定的时间
            initialTime: _nowTime
        ).then((value) {
          if (value == null) {
            return;
          }
          setState(() {
            this._nowTime = value;
          });
        });
      }

      @override
  void initState() {
    super.initState();

      //命名构造函数获取当前时间
      var currentTime = DateTime.now();
      print('当前时间是：$currentTime');

      //获取时间戳
      var timeStamp = currentTime.millisecondsSinceEpoch;
      print('当前时间戳：$timeStamp');

      // 时间戳转换成日期
      var date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
      print('时间戳转日期：$date');


      //默认构造函数 构造时间
      var buildTime = new DateTime(2019, 10, 12, 15, 20,20);
      print("构造函数构造时间：$buildTime");

      // 字符串转date 只支持 “ - ” 拼接方式
      DateTime date2 = DateTime.parse("2019-12-20 14:30:33");
      print("时间字符串转DateTime $date2");
      // 时间比较

      print("date在date2之前： ${date.isBefore(date2)}");
      print("date在currentTime之后： ${date.isAfter(currentTime)}");
      print("currentTime和buildTime是否相等： ${currentTime.isAtSameMomentAs(buildTime)}");
      // 大于返回1；等于返回0；小于返回-1。
      print("时间比较结果： ${currentTime.compareTo(date)}");

      //时间增加
      var addDay = buildTime.add(new Duration(days: 3));
      print('buildTime 加3天：$addDay');

      //时间减少
      DateTime lessDay = buildTime.subtract(new Duration(days: 5));
      print('buildTime减5天：$lessDay');

      //时间差   两个时间相差 小时数

      print('两个时间时差计算：${addDay.difference(lessDay)}');

      print('本地时区简码：${buildTime.timeZoneName}');

      print('返回UTC与本地时差：${buildTime.timeZoneOffset}');

      print('获取年月日：${buildTime.year} 年 ${buildTime.month} 月  ${buildTime.day} 日');

      //获取星期几
      print('周：${buildTime.weekday}');


      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TimePickerPage"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${_nowDate.year} 年 ${_nowDate.month} 月 ${_nowDate.day} 日"),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    onTap: _showDatePicker,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${_nowTime.format(context)}"),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    onTap: _showTimePicker,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
