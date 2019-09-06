import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/util/ToastUtil.dart';

import 'ExpandDropdownButton.dart';

class PopViewPage extends StatefulWidget {
  PopViewPage({Key key}) : super(key: key);

  _PopViewPageState createState() => _PopViewPageState();
}

class _PopViewPageState extends State<PopViewPage> {

  var content = 'One1252s2d2s555';
  @override
  Widget build(BuildContext context) {

    var raisedButton =  RaisedButton(
        child: Text('AlertDialog对话框'),
        onPressed: (){

          showMenu(
              context: context,
              position: RelativeRect.fromSize(Rect.fromLTWH(100,80, 10, 2000), Size(100, 1000)),
              elevation: 10,
              items: <PopupMenuItem<String>>[
                PopupMenuItem<String>( value: 'value01', child: new Text('Item One'),height: 100,),
                PopupMenuItem<String>( value: 'value02', child: new Text('Item Two')),
                PopupMenuItem<String>( value: 'value03', child: new Text('Item Three')),
                PopupMenuItem<String>( value: 'value04', child: new Text('I am Item Four'))
              ] ).then((value){
            if(null == value){
              return;
            }
            ToastUtil.show(value.toString());
          });
        });

    return Scaffold(
        appBar: AppBar(
          title: Text("PopViewPage"),
          actions: <Widget>[
            _NomalPopMenu(),
            _CheckPopMenu(),
            _DividerPopMenu(),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

               raisedButton,


              SizedBox(height: 20),
              Container(
                child:DropdownButton<String>(
                  value: content,
                  iconDisabledColor: Colors.blue,
                  iconEnabledColor: Colors.yellow,
                  underline: Container(color: Colors.red,height: 1,),
                  onChanged: (String newValue) {
                    setState(() {
                      content = newValue;
                    });
                  },
                  items: <String>['One1252s2d2s555', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              )),
              SizedBox(height: 20),


              Container(
                  child:ExpandDropdownButton<String>(
                    value: content,
                    alwaysBottom: true,
                    marginTop: 10,
                    icon: Icon(Icons.arrow_drop_down,size: 20,),
                    iconDisabledColor: Colors.blue,
                    iconEnabledColor: Colors.yellow,
                    underline: Container(color: Colors.red,height: 1,),
                    onChanged: (String newValue) {
                      setState(() {
                        content = newValue;
                      });
                    },
                    items: <String>['One1252s2d2s555', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
            ],
          ),
        ));

  }


  Widget _NomalPopMenu() {

    return new PopupMenuButton<String>(
        offset: Offset(0, 60),
        tooltip: "value00",
        icon: Icon(Icons.close),
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
           PopupMenuItem<String>(
              value: 'value01', child:  Text('Item One')),

           PopupMenuItem<String>(
              value: 'value02', child:  Text('Item Two')),
           PopupMenuItem<String>(
              value: 'value03', child:  Text('Item Three')),
           PopupMenuItem<String>(
              value: 'value04', child:  Text('I am Item Four'))
        ],
        onSelected: (String value) {

          ToastUtil.show(value.toString());
        });
  }

  Widget _CheckPopMenu() {
    return new PopupMenuButton<String>(
        offset: Offset(0, 60),
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
          new CheckedPopupMenuItem<String>(
              checked: false, value: 'value01', child: new Text('Item One')),
          new CheckedPopupMenuItem<String>(
              checked: true, value: 'value02', child: new Text('Item Two')),
          new CheckedPopupMenuItem<String>(
              checked: false, value: 'value03', child: new Text('Item Three')),
          new CheckedPopupMenuItem<String>(
              checked: false, value: 'value04', child: new Text('I am Item Four'))
        ],
        onSelected: (String value) {

          ToastUtil.show(value.toString());
        });
  }

  Widget _DividerPopMenu() {
    return new PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          new PopupMenuItem<String>( value: 'value01', child: new Text('Item One')),
          new PopupMenuDivider(height: 1.0),
          new PopupMenuItem<String>( value: 'value02', child: new Text('Item Two')),
          new PopupMenuDivider(height: 1.0),
          new PopupMenuItem<String>( value: 'value03', child: new Text('Item Three')),
          new PopupMenuDivider(height: 1.0),
          new PopupMenuItem<String>( value: 'value04', child: new Text('I am Item Four'))
        ],
        onSelected: (String value) {
          ToastUtil.show(value.toString());
        });
  }




}
