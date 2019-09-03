

    /*
     * creat_user: zhengzaihong
     * Email:1096877329@qq.com
     * creat_date: 2019/9/2
     * creat_time: 15:33
     * describe 全局静态管理类
     **/


    import 'dart:io';

    import 'package:path_provider/path_provider.dart';
    import 'package:shared_preferences/shared_preferences.dart';

    class Global{

      //定义一个静态属性 name
      static String name = "张三";


      //定义一个全局的 sp
      static SharedPreferences preferences;

      static File file;

      //初始化
      static void initPreferences() async{
        preferences= await SharedPreferences.getInstance();
      }

      //初始化一个文件，方便使用
      static void initFile() async{

        final directory = await getApplicationDocumentsDirectory();
        if (!(file is File)) {
          final String path = directory.path;
          file = File('$path/myInfo.txt');
         if( !file.existsSync()){
           // 不存在则创建文件
           file.createSync(recursive: true);
         }
        }
      }

    }

