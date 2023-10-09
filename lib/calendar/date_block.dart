import 'package:flutter/material.dart';

class DateBlock extends StatelessWidget {
  late final IconData? icon;
  late final int day;

  DateBlock(int day, IconData? icon){
    this.day = day;
    this.icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    // アイコン指定がない場合
    if(icon == null){
      return Container(
        height: 40,
        alignment: Alignment.bottomCenter,
        child: Text(day.toString()),
      );
    }
    // アイコン指定ありの場合
    else {
      return
        Container(
          height: 40,
          child:Column(
            children: [
              Icon(icon),
              Text(day.toString())
            ],
          ),
        );
    }
  }
}