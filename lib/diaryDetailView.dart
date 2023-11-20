import 'package:diary_app/db/diary_table_dao.dart';
import 'package:diary_app/db/diary_table_dto.dart';
import 'package:flutter/material.dart';
import 'package:diary_app/db/database_manager.dart';
import 'package:sqflite_common/sqlite_api.dart';

class diaryDetailView extends StatelessWidget {

  //database_manager.dartのDatabaseManagerクラスをインスタンスを取得
  final DatabaseManager dbManager = DatabaseManager.instance;
  late int _selectDate;

  diaryDetailView(DateTime date){
    _selectDate = (date.year*10000) + (date.month*100) + date.day;
  }

  @override
  Widget build(BuildContext context) {

    Future<DiaryTableDto> row = _serect();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,  // タイトルを中央寄せする
        title: Text("日記本文"),
      ),
      body: Container(
        width: double.infinity,
        child:FutureBuilder<DiaryTableDto>(
          future: row,
          builder: (context, snapshot) {
            //　データ取得に失敗した場合
            if(snapshot.hasError){
              // エラーメッセージの取得
              final error  = snapshot.error;
              return   const Text("日記がありません。",style: TextStyle(fontSize: 20,),);

              // データがある場合
            } else if (snapshot.hasData) {
              // getResultメソッドがreturnした値を取得
              DiaryTableDto result = snapshot.data!;
              String resultStr = result.diaryText;
              return Text('$resultStr', style: TextStyle(fontSize: 20,),);

              // データ取得中の場合
            } else {
              return  const Text("しばらくお待ち下さい",style: TextStyle(fontSize: 20,),);
            }
          },
        )
      ),
    );
  }
  Future<DiaryTableDto> _serect() async {
    // daoとdbを取得
    DiaryTableDao dao = DatabaseManager.getDiaryTableDao();
    Database db = await dbManager.database;

    DiaryTableDto dto = await dao.queryRowDiaryDate(db,_selectDate);
    return dto;
  }
}