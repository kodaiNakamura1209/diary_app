import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/date_symbol_data_local.dart';    // 翻訳用ライブラリ
import 'package:diary_app/calendar/calendar.dart';

class diaryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<DateTime> _days=[DateTime(2020, 12, 20), DateTime(2020, 12, 21)]; //アイコンを表示する日

    return Scaffold(
        appBar: AppBar(

          title: Text("日記一覧"),
        ),
        body: Container(
          child: Calendar(),
        )
      );
    }
  }
