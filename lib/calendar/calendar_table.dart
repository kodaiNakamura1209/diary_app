import 'package:flutter/material.dart';
import 'date_block.dart';

class CalendarTable extends StatelessWidget {

  final DateTime _startDay = DateTime(2023, 10, 1);

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Center(
          child: Column(
            children: [
              Text(
                  "2023年10月"
              ),
              Table(
                border: TableBorder.all(),
                children: [
                  const TableRow(
                      children: [
                        Text("日",textAlign: TextAlign.center),
                        Text("月",textAlign: TextAlign.center),
                        Text("火",textAlign: TextAlign.center),
                        Text("水",textAlign: TextAlign.center),
                        Text("木",textAlign: TextAlign.center),
                        Text("金",textAlign: TextAlign.center),
                        Text("土",textAlign: TextAlign.center)
                      ]
                  ),
                  TableRow(
                      children: [
                        DateBlock(_startDay.day, Icons.book_rounded),
                        DateBlock(_startDay.day,null),
                        DateBlock(_startDay.day, Icons.book_rounded),
                        DateBlock(_startDay.day,null),
                        DateBlock(_startDay.day, Icons.book_rounded),
                        DateBlock(_startDay.day,null),
                        DateBlock(_startDay.day, Icons.book_rounded),
                      ]
                  ),
                  TableRow(
                      children: [
                        DateBlock(_startDay.day, Icons.book_rounded),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                      ]
                  ),
                  TableRow(
                      children: [
                        DateBlock(_startDay.day, Icons.book_rounded),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                      ]
                  ),
                  TableRow(
                      children: [
                        DateBlock(_startDay.day, Icons.book_rounded),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                      ]
                  ),
                  TableRow(
                      children: [
                        DateBlock(_startDay.day, Icons.book_rounded),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                      ]
                  ),
                ],
              )
            ],
          ),
        )
    );
  }

  CreateCalendarCell(){

  }
// 色々考えたけど、DateTimeクラスで地道にcalendar作るしかなさそう？(この日付の次の日とかで検索かけて特定の日付まで行けば、、、)
}