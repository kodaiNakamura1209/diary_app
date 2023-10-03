import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';  // カレンダー用ライブラリ
import 'package:intl/date_symbol_data_local.dart';    // 翻訳用ライブラリ

class diaryListView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("日記一覧"),
        ),
        body:
        Center(
          child:
              TableCalendar(  // カレンダーを実装
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  locale: 'ja_JP' // 言語を日本語に設定
              ),
        ),
      );
    }
  }
