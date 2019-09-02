

/*
 * creat_user: zhengzaihong
 * Email:1096877329@qq.com
 * creat_date: 2019/9/2
 * creat_time: 16:44
 * describe 用户信息单例类
 **/


      class UserHelper{
///        饿汉式
//        // 单例公开访问点
//        factory UserHelper() =>_userInstance();
//
//        static UserHelper get instance => _userInstance();
//
//        // 静态私有成员，没有初始化
//        static UserHelper _instance = UserHelper._();
//
//        // 私有构造函数
//        UserHelper._() {
//          // 具体初始化代码
//          print("------>初始化");
//        }
//
//        // 静态、同步、私有访问点
//        static UserHelper _userInstance() {
//
//          return _instance;
//        }
//
//        String getUserName(){
//
//          return "张三";
//        }

///     懒汉式
        // 单例公开访问点
        factory UserHelper() =>_userInstance();

        static UserHelper get instance => _userInstance();

        // 静态私有成员，没有初始化
        static UserHelper _instance;

        // 私有构造函数
        UserHelper._() {
          // 具体初始化代码
          print("------>初始化");
        }

        // 静态、同步、私有访问点
        static UserHelper _userInstance() {
          if (_instance == null) {
            _instance = UserHelper._();
          }
          return _instance;
        }


      }