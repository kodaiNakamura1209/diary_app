
import 'package:sqflite/sqflite.dart';

class DiaryTableDao{

  final table = 'DIARY_TABLE'; // テーブル名
  final columnDiaryDate = 'DIARY_DATE'; // 日付列
  final columnDiaryText = 'DIARY_TEXT'; // 本文列
  final columnImageId1 = 'IMAGE_ID_1'; // 画像ID1列
  final columnImageId2 = 'IMAGE_ID_2'; // 画像ID2列
  final columnImageId3 = 'IMAGE_ID_3'; // 画像ID3列
  final columnImageId4 = 'IMAGE_ID_4'; // 画像ID4列

  // DiaryTableDaoクラスをシングルトンにするためのコンストラクタ
  DiaryTableDao._privateConstructor();
  static final DiaryTableDao instance = DiaryTableDao._privateConstructor();

  // DBを作成するメソッド
  static Future<void> createTable(Database db) async {
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
  Future<int?> insert(Database db, Map<String, dynamic> row) async {
    return await db.insert(table, row); //テーブルにマップ型のものを挿入。追加時のrowIDを返り値にする
  }

}