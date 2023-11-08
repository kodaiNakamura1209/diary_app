import 'package:sqflite/sqflite.dart';

class DiaryTableDto{
  int _diaryDate = 0;
  String _diaryText = "";
  String? _imageId1;
  String? _imageId2;
  String? _imageId3;
  String? _imageId4;

  // Getter
  int get diaryDate => _diaryDate;
  String get diaryText => _diaryText;
  String? get imageId1 => _imageId1;
  String? get imageId2 => _imageId2;
  String? get imageId3 => _imageId3;
  String? get imageId4 => _imageId4;

  // setter
  set diaryDate (int i){
    _diaryDate = i;
  }
  set diaryText (String s){
    _diaryText = s;
  }
  set imageId1 (String? s){
    _imageId1 = s;
  }
  set imageId2 (String? s){
    _imageId2 = s;
  }
  set imageId3 (String? s){
    _imageId3 = s;
  }
  set imageId4 (String? s){
    _imageId4 = s;
  }
}