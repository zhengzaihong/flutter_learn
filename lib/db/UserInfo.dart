
/*
 * creat_user: zhengzaihong
 * Email:1096877329@qq.com
 * creat_date: 2019/9/4
 * creat_time: 10:42
 * describe 用户信息实体
 **/
class UserInfo{

  String name;

  String password;

  int age;


  UserInfo({this.name,this.age,this.password});


  UserInfo.toUser(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    password = json['password'];
  }



  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['password'] = this.password;
    return data;
  }

}