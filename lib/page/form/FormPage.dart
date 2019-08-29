import 'package:flutter/cupertino.dart';
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
                  // CheckBoxWidget()
                  ///单选按钮
                  //RadioButtonWidget()
                  ///表单提交校验
                  FormFieldWidget()
                ],
              ),
            )));
  }
}

class RadioButtonWidget extends StatefulWidget {
  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  bool _isSelected = false;
  int _sex = 0;
  bool _switchSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 0,
              activeColor: Colors.blue,
              // 绑定_sex变量的 的Radio 为同一 Group.
              groupValue: this._sex,
              onChanged: (value) {
                setState(() {
                  this._sex = value;
                });
              },
            ),
            Text('男'),
            Radio(
              value: 1,
              activeColor: Colors.blue,
              groupValue: this._sex,
              onChanged: (value) {
                setState(() {
                  this._sex = value;
                });
              },
            ),
            Text('女'),
          ],
        ),
        Row(
          children: <Widget>[
            Text('性别：${this._sex} : ${this._sex == 0 ? '男' : '女'}'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        RadioListTile(
          activeColor: Colors.pink,
          title: Text('标题'),
          subtitle: Text('二级标题'),
          secondary: Image.asset(
            "images/mm.jpg",
            fit: BoxFit.cover,
            // color: Colors.grey[200],
            width: 60,
          ),
          selected: this._sex == 0,
          value: 0,
          groupValue: this._sex,
          onChanged: (value) {
            setState(() {
              this._sex = value;
            });
          },
        ),
        Divider(height: 1),
        RadioListTile(
          activeColor: Colors.pink,
          title: Text('标题'),
          subtitle: Text('二级标题'),
          secondary: Image.asset(
            "images/mm.jpg",
            fit: BoxFit.cover,
            // color: Colors.grey[200],
            width: 60,
          ),
          selected: this._sex == 1,
          value: 1,
          groupValue: this._sex,
          onChanged: (value) {
            setState(() {
              this._sex = value;
            });
          },
        ),
        SizedBox(
          height: 20,
          child: Text("Android风格"),
        ),
        Container(
          width: 60,
          child: Switch(
            //当前状态
            value: _switchSelected,
            // 激活时原点颜色
            activeColor: Colors.blue,
            activeTrackColor: Colors.blue.shade50,
            inactiveTrackColor: Colors.blue.shade50,
            onChanged: (value) {
              //重新构建页面
              setState(() {
                _switchSelected = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
          child: Text("IOS风格"),
        ),
        CupertinoSwitch(
          value: _switchSelected,
          // 激活时原点颜色
          activeColor: Colors.blue,
          onChanged: (value) {
            //重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        SwitchListTile(
          secondary: Icon(Icons.wifi),
          //一级标题
          title: Text('wifi开关'),
          //二级标题
          subtitle: Text("选中可以打开wifi"),
          value: _switchSelected,
          //添加三行文本显示高度
          isThreeLine: true,

          selected: _switchSelected,

          onChanged: (bool value) {
            setState(() {
              _switchSelected = !_switchSelected;
            });
          },
        ),
      ],
    );
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

class FormFieldWidget extends StatefulWidget {
  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  String userName = "";

  String userPass = "";

  @override
  void initState() {
    super.initState();

    //添加监听
    _unameController.addListener(() {
      userName = _unameController.text;
    });

    _pwdController.addListener(() {
      userPass = _pwdController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Form(
        key: _formKey, //设置globalKey，用于后面获取FormState
        autovalidate: true, //开启自动校验
        child: Column(
          children: <Widget>[
        Scrollable(),
            TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)),
                // 校验用户名
                validator: (v) {
                  return v.trim().length > 0 ? null : "用户名不能为空";
                }),
            TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock)),
                obscureText: true,
                //校验密码
                validator: (v) {
                  return v.trim().length > 5 ? null : "密码不能少于6位";
                }),
            // 登录按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("登录"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。

                        FormState state = (_formKey.currentState as FormState);
                        if (state.validate()) {
                          ToastUtil.show("账号：$userName" + " 密码：$userPass");

                          //验证通过提交数据,并清空表单
                          //state.reset();
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
