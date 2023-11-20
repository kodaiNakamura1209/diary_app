import 'package:flutter/material.dart';
import 'package:diary_app/calendar/calendar.dart';
import 'package:diary_app/diaryDetailView.dart';
import 'package:sqflite/sqflite.dart';

import 'db/database_manager.dart';
import 'db/diary_table_dao.dart';
import 'db/diary_table_dto.dart';

class diaryListView extends StatelessWidget {

  //database_manager.dartのDatabaseManagerクラスをインスタンスを取得
  final DatabaseManager dbManager = DatabaseManager.instance;

  @override
  Widget build(BuildContext context) {
    // 日付押下時の処理
    void onTapDate(DateTime date){
      print(date.year.toString()+"年"+date.month.toString()+"月"+date.day.toString()+"日");

      // 日記詳細画面に遷移
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => diaryDetailView(date)),
      );
    }

    // 日記が作成されている日付
    Future<Map<int, IconData>?> _diaryCreatedMap = _getDiaryCreatedMap();

    return Scaffold(
        appBar: AppBar(

          title: Text("日記一覧"),
        ),
        body: Container(
          child:FutureBuilder<Map<int, IconData>?>(
            future:_diaryCreatedMap,
            builder: (context,snapshot){
              if(snapshot.hasError){
                //　データ取得に失敗した場合
                // エラーメッセージの取得
                final error  = snapshot.error;
                return   const Text("日記がありません。",style: TextStyle(fontSize: 20,),);

              } else if (snapshot.hasData) {
                // データがある場合

                Map<int, IconData>? result = snapshot.data;

                return Calendar(
                  onTapDate: onTapDate,
                  startYearMonth: DateTime(2023, 11, 1),
                  endYearMonth: DateTime(2024, 12, 1),
                  iconMap: result,
                );

                // データ取得中の場合
              } else {
                return Calendar(
                  onTapDate: onTapDate,
                  startYearMonth: DateTime(2023, 11, 1),
                  endYearMonth: DateTime(2024, 12, 1),
                );
              }
            },
          )
          // ),
        )
      );
    }

    // テーブル検索処理
    Future<DiaryTableDto> _Serect() async {
      // daoとdbを取得
      DiaryTableDao dao = DatabaseManager.getDiaryTableDao();
      Database db = await dbManager.database;

      DiaryTableDto dto = await dao.queryAllRows(db);
      return dto;
    }

    // 日記作成済み日付Map作成処理
    Future<Map<int, IconData>?> _getDiaryCreatedMap() async {
        DiaryTableDto dto = await _Serect();
        List<int>? diaryDateList = dto.diaryDateList;
        Map<int, IconData>? _diaryCreatedMap = {};
        if(diaryDateList != null && diaryDateList!.isNotEmpty){
          for (int date in diaryDateList) {
            _diaryCreatedMap?[date] = Icons.check_outlined;
            print(date);
          }
        } else {
          _diaryCreatedMap = null;
        }

        return _diaryCreatedMap;
      }
  }
