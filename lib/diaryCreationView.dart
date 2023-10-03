import 'dart:io';

import 'package:diary_app/db/diary_table_dao.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:diary_app/db/database_manager.dart';
import 'package:sqflite_common/sqlite_api.dart';

class diaryCreationView extends StatelessWidget {

  //database_manager.dartのDatabaseManagerクラスをインスタンス化
  final DatabaseManager dbManager = DatabaseManager.instance;

  final ImagePicker _picker = ImagePicker();  // 画像選択用オブジェクト
  File? _file;  // 画像格納用ファイルオブジェクト  (?はnullを許容するという意味)

  late DateTime nowDate;  // 現在日付   (lateは後でnull以外を設定するという意味
  final DateFormat format = DateFormat('yyyy年M月d日'); // フォーマット用変数
  String headerText = ""; // ヘッダー用文字列

  // コンストラクタ
  diaryCreationView(){
    nowDate = DateTime.now();  // 現在時刻
    headerText = format.format(nowDate);  // yyyy年M月d日をヘッダーに設定
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,  // タイトルを中央寄せする
        title: Text(headerText),
      ),
      body: Container(
        width: double.infinity,
        child: const TextField(   // 入力テキストフィールド
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(    //テキスト フィールドを装飾するために使用
            border: InputBorder.none,     // テキストフィールドのボーダーを削除
            hintText: '本文',
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.large(   // 作成ボタン
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), //角の丸み
            ),
            child: const Icon(Icons.my_library_add),
            onPressed: () {
              _insert();
            },
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton.large(   // 画像追加ボタン
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), //角の丸み
            ),
            child: const Icon(Icons.add_a_photo),
            onPressed: () async {
              final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
              _file = File(_image!.path);
            },
          ),
        ],
      ),
    );
  }

  // insertが押されたときのメソッド
  void _insert() async {
    DiaryTableDao dao = DatabaseManager.getDiaryTableDao();
    Database db = await dbManager.database;
    Map<String, dynamic> row = {
      dao.columnDiaryDate : 20230925,
      dao.columnDiaryText : "日記",
      dao.columnImageId1 : null,
      dao.columnImageId2 : null,
      dao.columnImageId3 : null,
      dao.columnImageId4 : null,
    };
    final id = await dao.insert(db,row);
    print('inserted row id: $id');
  }
}