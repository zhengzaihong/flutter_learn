import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/util/ToastUtil.dart';
import 'package:date_format/date_format.dart';


class TimePickerPage extends StatefulWidget {

  TimePickerPage({Key key}) : super(key: key);

  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {

  DateTime _nowDate =DateTime.now();

  var _nowTime=TimeOfDay(hour: 12,minute:20 );


  _showDatePicker() {

    //  showDatePicker(
    //    context:context,
    //    initialDate:_nowDate,
    //    firstDate:DateTime(1980),
    //    lastDate:DateTime(2100),
    //  ).then((result){
    //     print(result);
    //  });

     showDatePicker(
      context:context,
      initialDate:_nowDate,
      firstDate:DateTime(1980),
      lastDate:DateTime(2100),
      //  locale: Locale('zh'),      //非必须
    ).then((value){
       if(value==null){
         return;
       }
       setState(() {
         this._nowDate= value;
       });
     });
  }

  _showTimePicker() {

   showTimePicker(
        context:context,
        initialTime: _nowTime
    ).then((value){

      if(value==null){
        return;
      }

      setState(() {
        this._nowTime= value;
      });
    });

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
                        Text("${formatDate(_nowDate, [yyyy, '年', mm, '月', dd])}"),
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
