import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/util/ToastUtil.dart';

import 'ExpandDropdownButton.dart';
import 'ExpandPopupMenuDivider.dart';

class PopViewPage extends StatefulWidget {
  PopViewPage({Key key}) : super(key: key);

  _PopViewPageState createState() => _PopViewPageState();
}

class _PopViewPageState extends State<PopViewPage> {
  var content = 'One';
  var content1 = 'One';

  @override
  Widget build(BuildContext context) {
    var raisedButton = RaisedButton(
        child: Text('Pop弹出窗'),
        onPressed: () {
          showMenu(
              context: context,
              position: RelativeRect.fromSize(Rect.fromLTRB(150, 130, 0, 0),Size(100, 200)),
              elevation: 10,
              items: <PopupMenuItem<String>>[
                PopupMenuItem<String>(value: 'Item01', child: Text('Item One'),
                ),
                PopupMenuItem<String>(value: 'Item02', child: Text('Item Two SFDFDGDGDGG')),
                PopupMenuItem<String>(
                    value: 'Item03', child: Text('Item Three')),
                PopupMenuItem<String>(value: 'Item04', child: Text('Item Four'))
              ]).then((value) {
            if (null == value) {
              return;
            }
            ToastUtil.show(value.toString());
          });
        });

    return Scaffold(
        appBar: AppBar(
          title: Text("PopViewPage"),
          actions: <Widget>[
            _NormalPopMenu(),
            _DividerPopMenu(),
            _CustomPopMenu()
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              raisedButton,
              SizedBox(height: 20),
              Container(
                  child: DropdownButton<String>(
                value: content,
                iconDisabledColor: Colors.blue,
                iconEnabledColor: Colors.yellow,
                underline: Container(
                  color: Colors.red,
                  height: 1,
                ),
                onChanged: (String value) {
                  setState(() {
                    content = value;
                  });
                },
                items: <String>["One", 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
//              SizedBox(height: 20),
//              Container(
//                  child: ExpandDropdownButton<String>(
//                value: content,
//                alwaysBottom: true,
//                marginTop: 10,
//                drawPadding: 40,
//                icon: Icon(
//                  Icons.arrow_drop_down,
//                  size: 20,
//                ),
//                iconDisabledColor: Colors.blue,
//                iconEnabledColor: Colors.yellow,
//                underline: Container(
//                  color: Colors.red,
//                  height: 1,
//                ),
//                onChanged: (value) {
//                  setState(() {
//                    content1 = value;
//                  });
//                },
//                items: <String>[content, 'Two', 'Free', 'Four']
//                    .map<DropdownMenuItem<String>>((String value) {
//                  return DropdownMenuItem<String>(
//                    value: value,
//                    child: Text(value),
//                  );
//                }).toList(),
//              )),
            ],
          ),
        ));
  }

  Widget _NormalPopMenu() {
    return PopupMenuButton<String>(
        //dy 方向向下移动64个单位
        offset: Offset(0, 64),
        icon: Icon(Icons.settings),
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              PopupMenuItem<String>(value: 'Item01', child: Text('Item One')),
              PopupMenuItem<String>(value: 'Item02', child: Text('Item Two')),
              PopupMenuItem<String>(value: 'Item03', child: Text('Item Three')),
              PopupMenuItem<String>(value: 'Item04', child: Text('Item Four'))
            ],
        onSelected: (String value) {
          ToastUtil.show(value.toString());
        });
  }

  Widget _DividerPopMenu() {
    return PopupMenuButton<String>(
        offset: Offset(0, 64),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                  value: 'Item01',
                  child: CheckedPopupMenuItem<String>(
                      checked: false,
                      value: 'Item01',
                      child: Text('Item One'))),
              PopupMenuDivider(height: 1.0),
              PopupMenuItem<String>(
                  value: 'Item02',
                  child: CheckedPopupMenuItem<String>(
                      checked: true, value: 'Item02', child: Text('Item Two'))),
              PopupMenuDivider(height: 1.0),
              PopupMenuItem<String>(
                  value: 'Item03',
                  child: CheckedPopupMenuItem<String>(
                      checked: false,
                      value: 'Item03',
                      child: Text('Item Three'))),
              PopupMenuDivider(height: 1.0),
              PopupMenuItem<String>(
                  value: 'Item04',
                  child: CheckedPopupMenuItem<String>(
                      checked: false,
                      value: 'Item04',
                      child: Text('Item Four')))
            ],
        onSelected: (String value) {
          ToastUtil.show(value.toString());
        });
  }

  //自定义分割线 和 Item 样式
  Widget _CustomPopMenu() {
    return PopupMenuButton<String>(
        offset: Offset(0, 64),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Item01',
                child: Row(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                      child: Icon(Icons.search, color: Colors.blueAccent)),
                  Text('Item One')
                ]),
              ),
              ExpandPopupMenuDivider<String>(height: 2.0, color: Colors.red),
              PopupMenuItem<String>(
                  value: 'Item02',
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(Icons.home, color: Colors.blueAccent)),
                    Text('Item Two')
                  ])),
              ExpandPopupMenuDivider<String>(height: 2.0, color: Colors.red),
              PopupMenuItem<String>(
                  value: 'Item03',
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(Icons.person, color: Colors.blueAccent)),
                    Text('Item Three')
                  ])),
              ExpandPopupMenuDivider<String>(height: 2.0, color: Colors.red),
              PopupMenuItem<String>(
                  value: 'Item04',
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(Icons.local_grocery_store,
                            color: Colors.blueAccent)),
                    Text('Item Four')
                  ]))
            ],
        onSelected: (String value) {
          ToastUtil.show(value.toString());
        });
  }
}
