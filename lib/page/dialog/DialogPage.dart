      import 'package:flutter/material.dart';
      import 'package:flutter_learn/util/ToastUtil.dart';

      class DialogPage extends StatefulWidget {
        DialogPage({Key key}) : super(key: key);

        _DialogPageState createState() => _DialogPageState();
      }

      class _DialogPageState extends State<DialogPage> {

        _alertDialog() {

          showDialog(
             //表示点击灰色背景的时候是否消失弹出框
              barrierDismissible:false,
              context:context,
              builder: (context){
                return AlertDialog(
                  //添加背景色
                  backgroundColor:Colors.white,
                  elevation: 1000,
                  // 文字内容内距
                  contentPadding:EdgeInsets.all(30) ,
                  //标题
                  title: Text("提示信息!",style: TextStyle(color: Colors.redAccent),),
                  //内容
                  content:Text("您确定要删除吗?"),
                    shape:RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(10))),

                  actions: <Widget>[
                    FlatButton(
                      child: Text("取消"),
                      onPressed: (){
                        Navigator.pop(context,'Cancle');
                      },
                    ),
                    FlatButton(
                      child: Text("确定"),
                      onPressed: (){
                        Navigator.pop(context,"Ok");
                      },
                    )
                  ],
                );
              }
          ).then((value){
            ToastUtil.show("回传值："+value);
          });
        }



  _simpleDialog() {

    showDialog(
        barrierDismissible:false,   //表示点击灰色背景的时候是否消失弹出框
        context:context,
        builder: (context){
          return SimpleDialog(
            title:Text("选择内容"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Option A"),
                onPressed: (){
                  print("Option A");
                  Navigator.pop(context,"A");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("Option B"),
                onPressed: (){
                  print("Option B");
                  Navigator.pop(context,"B");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("Option C"),
                onPressed: (){
                  print("Option C");
                  Navigator.pop(context,"C");
                },
              ),
              Divider(),

            ],

          );
        }
    ).then((value){
      print("结果"+value);
    });


  }

  _modelBottomSheet() async{

    var result=await showModalBottomSheet(
        context:context,
        builder: (context){
          return Container(
            height: 220,
            child: Column(
              children: <Widget>[

                ListTile(
                  title: Text("分享 A"),
                  onTap: (){
                    Navigator.pop(context,"分享 A");
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("分享 B"),
                  onTap: (){
                    Navigator.pop(context,"分享 B");
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("分享 C"),
                  onTap: (){
                    Navigator.pop(context,"分享 C");
                  },
                )
              ],
            ),
          );
        }
    );

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dialog"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('AlertDialog对话框'),
                onPressed: _alertDialog,
              ),
              SizedBox(height: 20),
//              RaisedButton(
//                child: Text('select弹出框-SimpleDialog'),
//                onPressed: _simpleDialog,
//              ),
//              SizedBox(height: 20),
//              RaisedButton(
//                child: Text('ActionSheet底部弹出框-showModalBottomSheet'),
//                onPressed: _modelBottomSheet,
//              ),
//              SizedBox(height: 20),
//              // fluttertoast
            ],
          ),
        )
    );
  }
}