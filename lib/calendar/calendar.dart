import 'package:flutter/material.dart';
import 'calendar_table.dart';

class Calendar extends StatelessWidget {
  late final DateTime _startYearMonth = DateTime(2023, 10, 1);
  late final DateTime _endYearMonth = DateTime(2024, 10, 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: CreateCalendarWiget(_startYearMonth, _endYearMonth),
      // children: [
      //   CalendarTable(2023,10),
      //   CalendarTable(2023,11),
      // ],
    );
  }

  // カレンダーWighet生成メソッド
  List<Widget>CreateCalendarWiget(DateTime startYearMonth,DateTime endYearMonth){
    print('カレンダー生成開始');
    // カレンダーテーブル格納リスト
    List<Widget> calendarTableList = [];

    // 入力チェックが問題なければ処理を実施
    if(inputCheck(startYearMonth,endYearMonth)){

      // 生成年月制御用変数
      int startYear = startYearMonth.year;
      int startMonth = startYearMonth.month;
      int intEndYearMonth = (endYearMonth.year * 100) + endYearMonth.month;

      // 開始年月が終了年月を超えるまで繰り返す
      while(intEndYearMonth >= (startYear * 100) + startMonth ){

        // カレンダーテーブルリストに現在のひと月分のカレンダーテーブルを追加
        calendarTableList.add(CalendarTable(startYear, startMonth));
        // 開始月を翌月にする
        ++startMonth;
        // 開始月が12を超えた場合、開始年と開始月を次の年の1月に変更する
        if(startMonth > 12){
          startYear += 1;
          startMonth = 1;
        }
      }
    }else{

    }
    print('カレンダー生成終了');
    return calendarTableList;
  }

  // 入力チェックメソッド
  bool inputCheck(DateTime startYearMonth,DateTime endYearMonth){
    return true;
  }
}