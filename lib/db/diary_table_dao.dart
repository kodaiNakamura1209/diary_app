import 'package:diary_app/db/diary_table_dto.dart';
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

  // 全件取得
  Future<List<Map<String, dynamic>>?> queryAllRows(Database db) async {
    return await db.query(table); //全件取得
  }

  // 日付を条件に取得
  Future<DiaryTableDto>queryRowDiaryDate(Database db, int diaryDate) async {
    // 日付を条件に検索をする
    var result = await db.query(table,where: columnDiaryDate+"=?",whereArgs: [diaryDate]);

    // 取得結果をDtoにつめる
    // Map<String, dynamic> row = {
    //   columnDiaryDate : result[0][columnDiaryDate]
    // };

    result.forEach((row) => print(row));
    DiaryTableDto dto = DiaryTableDto();
    dto.diaryDate = result[0][columnDiaryDate] as int;
    dto.diaryText = result[0][columnDiaryText] as String;
    dto.imageId1 = result[0][columnImageId1] as String?;
    dto.imageId2 = result[0][columnImageId2] as String?;
    dto.imageId3 = result[0][columnImageId3] as String?;
    dto.imageId4 = result[0][columnImageId4] as String?;

    print(dto.diaryDate.toString()+","+dto.diaryText);
    return dto;
  }
}