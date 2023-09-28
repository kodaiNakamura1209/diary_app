import 'package:diary_app/db/diary_table_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;   // パッケージをpに入れている

class DatabaseManager{

  static Database? _database; // データベースオブジェクト

  // DatabaseHelperクラスをシングルトンにするためのコンストラクタ
  DatabaseManager._privateConstructor();
  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  // databaseのgetterメソッド
  Future<Database> get database async {

    // DBを一度作成していれば、そのまま値を返す
    if (_database != null) {
      return _database!;
    }
    // DB未作成の場合(初期化がまだ)DBを作成する
    _database = await _initDatabase();
    return _database!;
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
    // 各テーブルを作成
    await DiaryTableDao.createTable(db);
  }

  // diaryTableDaoのインスタンスを返す
  static DiaryTableDao getDiaryTableDao(){
    return DiaryTableDao.instance;
  }
}