import 'package:flutter/material.dart';
import 'date_block.dart';

class CalendarTable extends StatelessWidget {

  // テーブル生成対象年
  late final int startYear;
  // テーブル生成対象月
  late final int startMonth;
  // テーブル生成対象年月(Date)
  late final DateTime _startDate;

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
                  startYear.toString()+"年"+startMonth.toString()+"月"
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
      children: CreateTableRow(),
    );
  }

  List<TableRow> CreateTableRow(){
    List<TableRow> tableRowList = [];
    // ヘッダー部を生成
    tableRowList.add(const TableRow(children: [
      Text("日",textAlign: TextAlign.center),
      Text("月",textAlign: TextAlign.center),
      Text("火",textAlign: TextAlign.center),
      Text("水",textAlign: TextAlign.center),
      Text("木",textAlign: TextAlign.center),
      Text("金",textAlign: TextAlign.center),
      Text("土",textAlign: TextAlign.center)
    ]));

    // for文でカレンダーを作成してListにつめる
    return tableRowList;
  }
}