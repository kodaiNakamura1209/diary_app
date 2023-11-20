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
  // 日付加算用の期間クラス(1日間を表している)
  final Duration duration = const Duration(days:1);
  // タップをトリガーに呼び出す関数
  final Function? onTapDate;
  // icon表示日付のマップ
  final Map<int,IconData>? _iconMap;

  // コンストラクタ
  // startYear・・・対象年
  // startMonth・・・対象月
  CalendarTable({Key? key, this.onTapDate, required this.startYear, required this.startMonth, Map<int, IconData>? iconMap}) : _iconMap = iconMap, super(key: key){
    _startDate = DateTime(startYear,startMonth,1);
  }
  // icon取得メソッド
  IconData? getIcon(DateTime date){
    // icon表示日付Mapのnullチェック
    if(_iconMap != null){
      int targetDate = (date.year*10000) + (date.month*100) + date.day;

      // 引数の日付とマッチする日付がMapにあった場合、iconDataを返す
      if(_iconMap!.containsKey(targetDate)){
        return _iconMap?[targetDate];
      } else {
        return null;
      }
    } else {
      return null;
    }
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
    for(int i = 0; i < 6; i++){

      // 2行目以降
      List<Widget> dateBlockList = [];

      // 1行目は曜日を考慮して設定を行う
      if (i == 0){
        switch(weekday){
          // 月の初めが日曜日の場合
          case CalendarConstants.Sunday:
            for(int j = 0; j < 7; j++){
              dateBlockList.add(DateBlock(onTapDate:onTapDate,date:calendarDay, icon:getIcon(calendarDay)));
              // カレンダー日付を次の日にする
              calendarDay = calendarDay.add(duration);
            }
            tableRowList.add(TableRow(children: dateBlockList));
            break;
          // 月の初めが月曜日の場合
          case CalendarConstants.Monday:
            dateBlockList.add(CalendarConstants.SPACER);
            for(int j = 0; j < 6; j++){
              dateBlockList.add(DateBlock(onTapDate:onTapDate,date:calendarDay, icon:getIcon(calendarDay)));
              // カレンダー日付を次の日にする
              calendarDay = calendarDay.add(duration);
            }
            tableRowList.add(TableRow(children: dateBlockList));
            break;
          // 月の初めが火曜日の場合
          case CalendarConstants.Tuesday:
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            for(int j = 0; j < 5; j++){
              dateBlockList.add(DateBlock(onTapDate:onTapDate,date:calendarDay, icon:getIcon(calendarDay)));
              // カレンダー日付を次の日にする
              calendarDay = calendarDay.add(duration);
            }
            tableRowList.add(TableRow(children: dateBlockList));
            break;
          // 月の初めが水曜日の場合
          case CalendarConstants.Wednesday:
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            for(int j = 0; j < 4; j++){
              dateBlockList.add(DateBlock(onTapDate:onTapDate,date:calendarDay, icon:getIcon(calendarDay)));
              // カレンダー日付を次の日にする
              calendarDay = calendarDay.add(duration);
            }
            tableRowList.add(TableRow(children: dateBlockList));
            break;
          // 月の初めが木曜日の場合
          case CalendarConstants.Thursday:
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            for(int j = 0; j < 3; j++){
              dateBlockList.add(DateBlock(onTapDate:onTapDate,date:calendarDay, icon:getIcon(calendarDay)));
              // カレンダー日付を次の日にする
              calendarDay = calendarDay.add(duration);
            }
            tableRowList.add(TableRow(children: dateBlockList));
            break;
          // 月の初めが金曜日の場合
          case CalendarConstants.Friday:
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            for(int j = 0; j < 2; j++){
              dateBlockList.add(DateBlock(onTapDate:onTapDate,date:calendarDay, icon:getIcon(calendarDay)));
              // カレンダー日付を次の日にする
              calendarDay = calendarDay.add(duration);
            }
            tableRowList.add(TableRow(children: dateBlockList));
            break;
          // 月の初めが土曜日の場合
          case CalendarConstants.Saturday:
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(CalendarConstants.SPACER);
            dateBlockList.add(DateBlock(onTapDate:onTapDate,date:calendarDay, icon:getIcon(calendarDay)));
            // カレンダー日付を次の日にする
            calendarDay = calendarDay.add(duration);
            tableRowList.add(TableRow(children: dateBlockList));
            break;
        }
      } else {
        // 1行目以外の場合
        for(int j = 0; j < 7; j++){
          // カレンダーの月が変わっていたら空widgetを入れる
          if(month != calendarDay.month){
            dateBlockList.add(CalendarConstants.SPACER);
          } else {
            // 日付をDataBlockのリストに入れる
            dateBlockList.add(DateBlock(onTapDate:onTapDate,date:calendarDay, icon:getIcon(calendarDay)));
            // カレンダー日付を次の日にする
            calendarDay = calendarDay.add(duration);
          }
        }

        // 日付ブロックwidgetリストをテーブル行widgetリストに格納する
        tableRowList.add(TableRow(children: dateBlockList));
      }

      // カレンダーの月が変わっていた場合、処理を終了する
      if(month != calendarDay.month){
        break;
      }
    }

    return tableRowList;
  }
}