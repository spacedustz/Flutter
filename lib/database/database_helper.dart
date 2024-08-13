import 'package:flutter_ex/note/data/note_info.dart';
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
      // DB가 생성될 때 실행되는 코드
      db.execute('''
        CREATE TABLE IF NOT EXISTS idea (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          motive TEXT,
          content TEXT,
          priority INTEGER,
          feedback TEXT,
          createdAt INTEGER
        )
      ''');
    },);
  }

  // DB 닫기 (앱 내에서 DB 사용을 하지 않을 경우 닫아줘야 함)
  Future<void> closeDatabase() async {
    await database.close();
  }

  // 아아디어 삽입
  Future<int> insertIdeaInfo(NoteInfo note) async {
    return await database.insert('idea', note.toMap());
  }

  // 모든 아이디어 조회
  Future<List<NoteInfo>> getAll() async {
    final List<Map<String, dynamic>> result = await database.query('idea');
    return List.generate(result.length, (index) {
      return NoteInfo.fromMap(result[index]);
    },);
  }
  
  // 아이디어 수정
  Future<int> updateIdea(NoteInfo note) async {
    return await database.update(
      'idea',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // 아이디어 삭제
  Future<int> deleteIdea(int id) async {
    return await database.delete(
      'idea',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}