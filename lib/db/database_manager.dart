import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;   // パッケージをpに入れている

class database_manager{

  // DB初期化メソッド
  Future<Database> initializeDB() async {
    //データベースファイルを保存するパスを取得　getDatabasesPathはsqfliteの関数
    String path = await getDatabasesPath();

    return openDatabase(    // openDatabase・・・データベースを開く
      p.join(path, 'diary_app_database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE DIARY_TABLE("
              "DIARY_DATE INTEGER PRIMARY KEY,"
              " DIARY_TEXT TEXT,"
              " IMAGE_ID_1 TEXT,"
              " IMAGE_ID_2 TEXT,"
              " IMAGE_ID_3 TEXT,"
              " IMAGE_ID_4 TEXT)",
        );
      },
      version: 1,
    );
  }
}