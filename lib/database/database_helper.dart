import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database database;

  // DB 초기화 및 열기
  Future<void> initDatabase() async {
    // DB 경로 가져오기
    String path = join(await getDatabasesPath(), 'note_app.db');

    // DB 열기 & 생성
    database = await openDatabase(path, version: 1, onCreate: (db, version) {

    },)
  }
}