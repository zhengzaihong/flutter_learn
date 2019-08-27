        import 'package:flutter/material.dart';
        import 'package:flutter/services.dart';
        import 'package:flutter_learn/util/ToastUtil.dart';

        class FormPagePage extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                    appBar: AppBar(
                      title: Text("FormPage"),
                    ),
                    body: Container(
                      margin: EdgeInsets.only(left: 20),
                      width: 300,
                      child: ListView(
                        children: <Widget>[
                          ///文本框组件
                          //TextFieldWidget()

                          ///复选框
                          CheckBoxWidget()
                        ],
                      ),
                    )));
          }
        }

        ///复选框
        class CheckBoxWidget extends StatefulWidget {
          @override
          _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
        }

        class _CheckBoxWidgetState extends State<CheckBoxWidget> {
          bool _isSelected = false;

          @override
          Widget build(BuildContext context) {
            return Column(
              children: <Widget>[

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                        value: _isSelected,
                        onChanged: (v) {
                          setState(() {
                            this._isSelected = v;
                          });
                        },
                        activeColor: Colors.red,
                        checkColor: Colors.blue),

                    SizedBox(width: 50),
                    Checkbox(
                      activeColor: Colors.green,
                      checkColor: Colors.yellow,
                      value: this._isSelected,
                      onChanged: (value) {
                        setState(() {
                          this._isSelected = value;
                        });
                      },
                    ),
                    Container(
                      child: Text(this._isSelected ? '选中' : '未选中'),
                    ),
                  ],
                ),


                CheckboxListTile(
                  title: Text('标题'),
                  subtitle: Text('二级标题'),
                  activeColor: Colors.pink,
                  selected: this._isSelected,
                  secondary: Image.asset(
                    "images/mm.jpg",
                    fit: BoxFit.cover,
                    // color: Colors.grey[200],
                    width: 60,
                  ),
                  value: this._isSelected,
                  onChanged: (value) {
                    setState(() {
                      this._isSelected = value;
                    });
                  },
                ),

              ],
            );
          }
        }

        //表单组件
        class TextFieldWidget extends StatelessWidget {
          String phone = "";
          String pass = "";

          @override
          Widget build(BuildContext context) {
            return Column(
              children: <Widget>[
                SizedBox(height: 40),
                Container(
                  height: 40,
                  child: TextField(
                    controller: TextEditingController(text: "187"),
                    //是否隐藏密码
                    obscureText: false,
                    //绑定焦点控制
                    focusNode: FocusNode(),
                    textCapitalization: TextCapitalization.sentences,
                    //控制光标样式
                    cursorColor: Colors.blue,
                    cursorRadius: Radius.circular(1.0),
                    cursorWidth: 1.0,
                    //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                    maxLines: 1,
                    //输入文本的样式
                    style: TextStyle(fontSize: 14.0, color: Colors.green),
                    //内容改变的回调
                    onChanged: (text) {
                      print('change $text');
                      phone = text;
                    },

                    decoration: InputDecoration(
                        labelText: '账户',
                        labelStyle: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 14,
                        ),
                        // 边框的内边距
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        hintText: '手机号',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        icon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          //边框圆角
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  child: TextField(
                    controller: TextEditingController(),
                    //是否隐藏密码
                    obscureText: true,
                    //绑定焦点控制
                    focusNode: FocusNode(),
                    //控制光标样式
                    cursorColor: Colors.blue,
                    cursorRadius: Radius.circular(1.0),
                    cursorWidth: 1.0,
                    //自动获取焦点
                    maxLines: 1,
                    autofocus: false,
                    //输入文本的样式
                    style: TextStyle(fontSize: 14.0, color: Colors.green),
                    //在弹出键盘的时候修改键盘类型
                    keyboardType: TextInputType.number,
                    //键盘回车键的样式
                    textInputAction: TextInputAction.send,
                    //允许的输入格式 WhitelistingTextInputFormatter.digitsOnly 只允许输入数字
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                    //内容改变的回调
                    onChanged: (text) {
                      print('change $text');
                      pass = text;
                    },

                    decoration: InputDecoration(
                        labelText: '密码',
                        labelStyle: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 14,
                        ),

                        // 边框的内边距
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        hintText: '密码',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        icon: Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          //边框圆角
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  child: RaisedButton(
                    child: Text('登录', style: TextStyle(color: Colors.white)),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      ToastUtil.show("账号：$phone" + " 密码：$pass");
                    },
                  ),
                ),
              ],
            );
          }
        }
