import 'dart:io';

import 'package:diary_app/db/diary_table_dao.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:diary_app/db/database_manager.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'db/diary_table_dto.dart';

class diaryCreationView extends StatelessWidget {

  //database_manager.dartのDatabaseManagerクラスをインスタンスを取得
  final DatabaseManager _dbManager = DatabaseManager.instance;
  final ImagePicker _picker = ImagePicker();  // 画像選択用オブジェクト
  File? _file;  // 画像格納用ファイルオブジェクト  (?はnullを許容するという意味)

  late DateTime _nowDate;  // 現在日付   (lateは後でnull以外を設定するという意味
  final DateFormat _format = DateFormat('yyyy年M月d日'); // フォーマット用変数
  String _headerText = ""; // ヘッダー用文字列
  String _diaryText = "";

  // コンストラクタ
  diaryCreationView(){
    _nowDate = DateTime.now();  // 現在日付
    _headerText = _format.format(_nowDate);  // yyyy年M月d日をヘッダーに設定
  }

  @override
  Widget build(BuildContext context) {

    // 現在日付
    int nowDateInt = (_nowDate.year*10000) + (_nowDate.month*100) + _nowDate.day;
    // 既存の日記を取得
    Future<DiaryTableDto> diaryTableDto = _serectTodayDiary(nowDateInt);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,  // タイトルを中央寄せする
        title: Text(_headerText),
      ),
      body: Container(
        width: double.infinity,
          child:FutureBuilder<DiaryTableDto>(
            future:diaryTableDto,
            builder: (context,snapshot){
              if(snapshot.hasError){
                //　データがなかった場合
                return TextField(   // 入力テキストフィールド
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(    //テキスト フィールドを装飾するために使用
                    border: InputBorder.none,     // テキストフィールドのボーダーを削除
                    hintText: '本文',
                  ),
                  onChanged: (text){
                    _diaryText = text;
                  },
                );

              } else if (snapshot.hasData) {
                // データがあった場合
                DiaryTableDto? result = snapshot.data;
                return
                 TextField(   // 入力テキストフィールド
                  keyboardType: TextInputType.multiline,
                  controller: TextEditingController(text: result?.diaryText),
                  maxLines: null,
                  decoration: const InputDecoration(    //テキスト フィールドを装飾するために使用
                    border: InputBorder.none,     // テキストフィールドのボーダーを削除
                    hintText: '本文',
                  ),
                  onChanged: (text){
                    _diaryText = text;
                  },
                );


              } else {
                // データ取得中の場合
                return Container();
              }
            },
          ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.large(   // 作成ボタン
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), //角の丸み
            ),
            child: const Icon(Icons.edit),
            onPressed: () {
              _diaryCreation(nowDateInt);
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

  // 作成ボタンが押されたときのメソッド
  void _diaryCreation(int nowDateInt) async {
    DiaryTableDao dao = DatabaseManager.getDiaryTableDao();
    Database db = await _dbManager.database;

    // 日記が存在するか確認する
    DiaryTableDto dto = await _serectTodayDiary(nowDateInt);
    print("日付："+dto.diaryDate.toString());

    Map<String, dynamic> row = {
      dao.columnDiaryDate : (_nowDate.year*10000) + (_nowDate.month*100) + _nowDate.day,
      dao.columnDiaryText : _diaryText,
      dao.columnImageId1 : null,
      dao.columnImageId2 : null,
      dao.columnImageId3 : null,
      dao.columnImageId4 : null,
    };
    final id = await dao.insert(db,row);
  }

  Future<DiaryTableDto> _serectTodayDiary(int nowDateInt) async {
    // daoとdbを取得
    DiaryTableDao dao = DatabaseManager.getDiaryTableDao();
    Database db = await _dbManager.database;

    DiaryTableDto dto = await dao.queryRowDiaryDate(db,nowDateInt);
    print("日付："+dto.diaryDate.toString());
    return dto;
  }
}