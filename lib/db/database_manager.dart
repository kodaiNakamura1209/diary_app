import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;   // パッケージをpに入れている

class DatabaseManager{

  static late Database _database; // データベースオブジェクト

  static final table = 'DIARY_TABLE'; // テーブル名
  static final columnDiaryDate = 'DIARY_DATE'; // 日付列
  static final columnDiaryText = 'DIARY_TEXT'; // 本文列
  static final columnImageId1 = 'IMAGE_ID_1'; // 画像ID1列
  static final columnImageId2 = 'IMAGE_ID_2'; // 画像ID2列
  static final columnImageId3 = 'IMAGE_ID_3'; // 画像ID3列
  static final columnImageId4 = 'IMAGE_ID_4'; // 画像ID4列

  // DatabaseHelperクラスをシングルトンにするためのコンストラクタ
  DatabaseManager._privateConstructor();
  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  // databaseのgetterメソッド
  Future<Database> get database async {

    // DBを一度作成していれば、そのまま値を返す
    if (_database != null) {
      return _database;
    }
    // DB未作成の場合(初期化がまだ)DBを作成する
    _database = await _initDatabase();
    return _database;
  }

  // DB初期化メソッド
  Future<Database> _initDatabase() async {
    //データベースファイルを保存するパスを取得　getDatabasesPathはsqfliteの関数
    String path = p.join(await getDatabasesPath(), 'diary_app_database.db');

    return openDatabase(    // openDatabase・・・データベースを開く
      path,
      onCreate:_onCreate,
      version: 1,
    );
  }

  // DBを作成するメソッド
  Future _onCreate(Database db, int version) async {
    // DBのCREATE文
    await db.execute(
        "CREATE TABLE DIARY_TABLE("
        "DIARY_DATE INTEGER PRIMARY KEY,"
        "DIARY_TEXT TEXT　NOT NULL,"
        "IMAGE_ID_1 TEXT,"
        "IMAGE_ID_2 TEXT,"
        "IMAGE_ID_3 TEXT,"
        "IMAGE_ID_4 TEXT)",
    );
  }

  // レコードのinsertメソッド
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database; //DBにアクセスする
    return await db.insert(table, row); //テーブルにマップ型のものを挿入。追加時のrowIDを返り値にする
  }
}