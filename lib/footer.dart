import 'package:diary_app/diaryCreationView.dart';
import 'package:diary_app/diaryListView.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State {

  // ボタンが押された時の処理
  void _onTap(int index) {
    if(0 == index){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => diaryListView()),
      );
    } else if (1 == index){
    } else if (2 == index){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => diaryCreationView()),
      );
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_stories),
          label: '今までの日記',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'あなたの地図',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: '日記を作る',
        ),
      ],
      onTap: _onTap,
    );
  }
}