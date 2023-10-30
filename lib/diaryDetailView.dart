import 'dart:io';

import 'package:diary_app/db/diary_table_dao.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:diary_app/db/database_manager.dart';
import 'package:sqflite_common/sqlite_api.dart';

class diaryDetailView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,  // タイトルを中央寄せする
        title: Text("日記本文"),
      ),
      body: Container(
        width: double.infinity,
        child: const TextField(   // 入力テキストフィールド
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(    //テキスト フィールドを装飾するために使用
            border: InputBorder.none,     // テキストフィールドのボーダーを削除
            hintText: '本文',
          ),
        ),
      ),
    );
  }
}