import 'package:flutter/material.dart';
import 'calendar_constants.dart';
import 'date_block.dart';

class CalendarTable extends StatelessWidget {

  // テーブル生成対象年
  late final int startYear;
  // テーブル生成対象月
  late final int startMonth;
  // テーブル生成対象年月(Date)
  late final DateTime _startDate;
  // 空欄のwidget
  final Widget SPACER = const Spacer();
  // 日付加算用の期間クラス(1日間を表している)
  final Duration duration = const Duration(days:1);

  // コンストラクタ
  // startYear・・・対象年
  // startMonth・・・対象月
  CalendarTable(this.startYear, this.startMonth){
    _startDate = DateTime(startYear,startMonth,1);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Center(
          child: Column(
            children: [
              Text(
                  startYear.toString()+CalendarConstants.dispYear+startMonth.toString()+CalendarConstants.dispMonth
              ),
              CreateTable(),
              // Table(
              //   border: TableBorder.all(),
              //   children: [
              //     const TableRow(
              //         children: [
              //           Text("日",textAlign: TextAlign.center),
              //           Text("月",textAlign: TextAlign.center),
              //           Text("火",textAlign: TextAlign.center),
              //           Text("水",textAlign: TextAlign.center),
              //           Text("木",textAlign: TextAlign.center),
              //           Text("金",textAlign: TextAlign.center),
              //           Text("土",textAlign: TextAlign.center)
              //         ]
              //     ),
              //     TableRow(
              //         children: [
              //           DateBlock(_startDate.day, Icons.book_rounded),
              //           DateBlock(_startDate.day,null),
              //           DateBlock(_startDate.day, Icons.book_rounded),
              //           DateBlock(_startDate.day,null),
              //           DateBlock(_startDate.day, Icons.book_rounded),
              //           DateBlock(_startDate.day,null),
              //           DateBlock(_startDate.day, Icons.book_rounded),
              //         ]
              //     ),
              //     TableRow(
              //         children: [
              //           DateBlock(_startDate.day, Icons.book_rounded),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //         ]
              //     ),
              //     TableRow(
              //         children: [
              //           DateBlock(_startDate.day, Icons.book_rounded),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //         ]
              //     ),
              //     TableRow(
              //         children: [
              //           DateBlock(_startDate.day, Icons.book_rounded),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //         ]
              //     ),
              //     TableRow(
              //         children: [
              //           DateBlock(_startDate.day, Icons.book_rounded),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //           Spacer(),
              //         ]
              //     ),
              //   ],
              // )
            ],
          ),
        )
    );
  }

  Table CreateTable(){
    return Table(
      border: TableBorder.all(),
      children: CreateTableRow(startYear,startMonth),
    );
  }

  // テーブル行生成メソッド
  List<TableRow> CreateTableRow(int year, int month){

    // テーブル行リスト
    List<TableRow> tableRowList = [];
    // カレンダー日付
    DateTime calendarDay = DateTime(year,month,1);
    // 曜日格納変数
    int weekday = calendarDay.weekday;

    // ヘッダー部を生成
    tableRowList.add(const TableRow(children: [
      Text(CalendarConstants.dispSunday,textAlign: TextAlign.center),
      Text(CalendarConstants.dispMonday,textAlign: TextAlign.center),
      Text(CalendarConstants.dispTuesday,textAlign: TextAlign.center),
      Text(CalendarConstants.dispWednesday,textAlign: TextAlign.center),
      Text(CalendarConstants.dispThursday,textAlign: TextAlign.center),
      Text(CalendarConstants.dispFriday,textAlign: TextAlign.center),
      Text(CalendarConstants.dispSaturday,textAlign: TextAlign.center)
    ]));

    // for文でカレンダーを作成してListにつめる
    for(int i = 0; i < 5; i++){

      // 1行目は曜日を考慮して設定を行う
      if (i == 0){
        switch(weekday){
        // 月の初めが日曜日の場合
          case CalendarConstants.Sunday:
            tableRowList.add(TableRow(children: [
              DateBlock(calendarDay.day, null),
            ]));
            break;
        // 月の初めが月曜日の場合
          case CalendarConstants.Monday:
            tableRowList.add(TableRow(children: [
              SPACER,
              DateBlock(calendarDay.day, null),
            ]));
            break;
        // 月の初めが火曜日の場合
          case CalendarConstants.Tuesday:
            tableRowList.add(TableRow(children: [
              SPACER,
              SPACER,
              DateBlock(calendarDay.day, null),
            ]));
            break;
        // 月の初めが水曜日の場合
          case CalendarConstants.Wednesday:
            tableRowList.add(TableRow(children: [
              SPACER,
              SPACER,
              SPACER,
              DateBlock(calendarDay.day, null),
            ]));
            break;
        // 月の初めが木曜日の場合
          case CalendarConstants.Thursday:
            tableRowList.add(TableRow(children: [
              SPACER,
              SPACER,
              SPACER,
              SPACER,
              DateBlock(calendarDay.day, null),
            ]));
            break;
        // 月の初めが金曜日の場合
          case CalendarConstants.Friday:
            tableRowList.add(TableRow(children: [
              SPACER,
              SPACER,
              SPACER,
              SPACER,
              SPACER,
              DateBlock(calendarDay.day, null),
            ]));
            break;
        // 月の初めが土曜日の場合
          case CalendarConstants.Saturday:
            tableRowList.add(TableRow(children: [
              SPACER,
              SPACER,
              SPACER,
              SPACER,
              SPACER,
              SPACER,
              DateBlock(calendarDay.day, null),
            ]));
            break;
        }
        // カレンダー日付を次の日にする
        calendarDay = calendarDay.add(duration);
      } else {
        // 2行目以降
        List<Widget> dateBlockList = [];

        for(int j = 0; j < 7; j++){
          // 最終行以外の場合
          if (i != 4){
            // 最終行以外の場合
            // 日付をDataBlockのリストに入れる
            dateBlockList.add(DateBlock(calendarDay.day, null));
            // カレンダー日付を次の日にする
            calendarDay = calendarDay.add(duration);
          } else {
            // 最終行の場合
            // カレンダーの月が変わっていたら空widgetを入れる
            if(month != calendarDay.month){
              dateBlockList.add(SPACER);
            } else {
              // 日付をDataBlockのリストに入れる
              dateBlockList.add(DateBlock(calendarDay.day, null));
              // カレンダー日付を次の日にする
              calendarDay = calendarDay.add(duration);
            }
          }
        }

        // 日付ブロックwidgetリストをテーブル行widgetリストに格納する
        tableRowList.add(TableRow(children: dateBlockList));
      }
    }

    return tableRowList;
  }
}