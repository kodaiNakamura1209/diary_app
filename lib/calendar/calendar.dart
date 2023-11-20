import 'package:flutter/material.dart';
import 'calendar_table.dart';

class Calendar extends StatelessWidget {
  final DateTime startYearMonth;
  final DateTime endYearMonth;
  // タップをトリガーに呼び出す関数
  final Function? onTapDate;
  final Map<int,IconData>? iconMap;

  Calendar({Key? key, this.onTapDate, required this.startYearMonth, required this.endYearMonth, this.iconMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: CreateCalendarWiget(startYearMonth, endYearMonth),
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
        calendarTableList.add(CalendarTable(onTapDate: onTapDate,startYear: startYear, startMonth: startMonth, iconMap: iconMap,));
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