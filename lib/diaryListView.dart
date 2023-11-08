import 'package:flutter/material.dart';
import 'package:diary_app/calendar/calendar.dart';
import 'package:diary_app/diaryDetailView.dart';

class diaryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<DateTime> _days=[DateTime(2020, 12, 20), DateTime(2020, 12, 21)]; //アイコンを表示する日

    // 日付押下時の処理
    void onTapDate(DateTime date){
      print(date.year.toString()+"年"+date.month.toString()+"月"+date.day.toString()+"日");

      // 日記詳細画面に遷移
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => diaryDetailView()),
      );
    }

    return Scaffold(
        appBar: AppBar(

          title: Text("日記一覧"),
        ),
        body: Container(
          child: Calendar(onTapDate: onTapDate, startYearMonth: DateTime(2023, 11, 1),endYearMonth: DateTime(2024, 12, 1)),
        )
      );
    }
  }
