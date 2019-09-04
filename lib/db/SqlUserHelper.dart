
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'UserInfo.dart';

/*
 * creat_user: zhengzaihong
 * Email:1096877329@qq.com
 * creat_date: 2019/9/4
 * creat_time: 10:58
 * describe 数据库帮助类
 **/
class SqlUserHelper{


  final String dataBaseName = "User.db";
  //数据库表明
  final String tableName = "USER_TABLE";

  //以下是表中的列名
  final String columnId = 'id';
  final String name = 'name';
  final String password = 'password';
  final String age ="age";

  // 静态私有成员
  static SqlUserHelper _instance;

  Database _database;
  // 私有构造函数
  SqlUserHelper._() {

    initDb();
  }

  //私有访问点
  static SqlUserHelper helperInstance() {
    if (_instance == null) {
      _instance = SqlUserHelper._();
    }
    return _instance;
  }


  //初始化数据库
   void initDb() async {

    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dataBaseName );

    // openDatabase 指定是数据库路径，版本号，和执行表的创建
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //创建UserInfo表
  void _onCreate(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, $password TEXT, $age INTEGER)');
  }


  /// 插入数据的两种方式
  ///
  /// insert第一种
  Future<int> insert(UserInfo userInfo){
    print("插入数据：${ userInfo.toMap()}");
    return _database.insert(tableName, userInfo.toMap());
  }

  /// insert第二种
  Future<int> rawInsert(UserInfo userInfo){
    return _database.rawInsert("INSERT INTO $tableName ($name,$password,$age) VALUES(?, ?, ?)", [userInfo.name,userInfo.password,userInfo.age]);
  }


  ///查询数据的两种方式

  ///第一种 query
  Future<List<Map>> query() async {
    List<Map> maps = await _database.query(tableName);
    if (maps.isNotEmpty) {
      return maps;
    }
    return null;
  }

  ///第二种 query
  Future<List<Map>> rawQuery() async {
    List<Map> maps = await _database.rawQuery("SELECT * FROM $tableName");
    if (maps.isNotEmpty) {
      return maps;
    }
    return null;
  }



  ///修改数据的两种方式

  ///第一种 update
  Future<int> update(UserInfo user,int id) async {
    return await _database.update(tableName,user.toMap(),where: '$columnId = ?', whereArgs: [id]);
  }

  ///第二种 rawUpdate
  Future<int> rawUpdate(UserInfo user,int id) async {
    return await _database.rawUpdate("UPDATE $tableName SET  $name = ?  WHERE $columnId = ? ",[user.name,id]);
  }


  ///删除数据的两种方式
  ///
  ///第一种 delete 根据id删除
  Future<int> delete(int id) async {
    return await _database.delete(tableName,
        where: "$columnId = ?", whereArgs: [id]);
  }


  ///第二种 delete  根据id删除
  Future<int> rawDelete(int id) async {
    return await _database.rawDelete("DELETE FROM $tableName WHERE $columnId = ?", [id]);
  }


  /// 开启事务添加
  Future<bool> transactionInsert(UserInfo userInfo1, UserInfo userInfo2) async {
    return await _database.transaction((Transaction txn) async {

      int id1 = await _database.insert(tableName, userInfo1.toMap());

      int id2 = await _database.insert(tableName, userInfo2.toMap());

      return id1 != null && id2 != null;
    });
  }


  /// 批处理
   void batch(UserInfo user) async {

     Batch batch =  _database.batch();

     //先添加一条数据
     batch.insert(tableName, user.toMap());
     //删除整张表
     batch.update(tableName,user.toMap(),where: '$columnId = ?', whereArgs: [0]);

    var result = batch.commit();

    print("batch result : ${result.toString()}");
  }


  ///关闭数据库
  Future close() async {
    return _database.close();
  }

}