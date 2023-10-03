import 'dart:io';

import 'package:diary_app/footer.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';  // カレンダー用ライブラリ
import 'package:intl/date_symbol_data_local.dart';    // 翻訳用ライブラリ
import 'package:image_picker/image_picker.dart';      // 画像操作用ライブラリ

void main() {
  initializeDateFormatting('ja').then((_) => runApp(MyApp())); //initializeDateFormatting('ja').then((_) => runApp(MyApp()))・・・アプリ自体のlocaleデータのセットアップ
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final ImagePicker _picker = ImagePicker();
  File? _file;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Center(
        child:Column(
          children: [
            TableCalendar(  // カレンダーを実装
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                locale: 'ja_JP' // 言語を日本語に設定
            ),
            Expanded(child:   //Widgetを使用可能なスペース全体に広げてくれるWidget。これを使うと、画面からはみ出ない
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text("今日の思い出"),
                    Image.asset('images/sample.jpg'),
                    Image.asset('images/sample.jpg'),
                    Image.asset('images/sample.jpg'),
                    Image.asset('images/sample.jpg'),
                    OutlinedButton(
                        onPressed: () async {
                          final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
                          _file = File(_image!.path);
                        },
                        child: const Text('画像を選択')
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    bottomNavigationBar: const Footer(),
    );
  }
}
