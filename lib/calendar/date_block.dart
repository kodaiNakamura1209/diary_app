import 'package:flutter/material.dart';

class DateBlock extends StatelessWidget {
  final IconData? icon;
  final DateTime date;
  final Function? onTapDate;  // タップをトリガーに呼び出す関数

  DateBlock({Key? key, this.onTapDate,required this.date, this.icon}) : super(key: key){
  }

  @override
  Widget build(BuildContext context) {
    // アイコン指定がない場合
    if(icon == null){
      return
        InkWell(
          onTap: (){onTapDate!(date);},  // 日付を引数に設定して実行
            child:Container(
              height: 40,
              alignment: Alignment.bottomCenter,
              child: Text(date.day.toString()),
            ),
        );
    } else {
      // アイコン指定ありの場合
      return
        InkWell(
          onTap: (){print("タップしました");},
          child: Container(
            height: 40,
            child:Column(
              children: [
                Icon(icon),
                Text(date.day.toString())
              ],
            ),
          ),
        );
    }
  }
}