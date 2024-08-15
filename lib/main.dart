import 'package:flutter/material.dart';
import 'package:flutter_ex/note/edit_screen.dart';

import 'note/data/note_info.dart';
import 'note/main_screen.dart';
import 'note/splash_screen.dart';

// import 'card/main_screen.dart';
// import 'card/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Card 프로젝트
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business Card',

      initialRoute: '/',
      routes: {
        // 명함 앱
        // '/': (context) => SplashScreen(),
        // '/main': (context) => MainScreen(),

        // 아이디어 앱
        '/': (context) => SplashScreen(),
        '/main': (context) => MainScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/edit') {
          // 데이터 객체가 없으면 등록 화면, 있으면 수정 화면 라우팅
          final NoteInfo? data = settings.arguments as NoteInfo?; // null 처리
          
          return MaterialPageRoute(builder: (context) {
            return EditScreen(data: data,);
          },);
        }
      },
    );
  }
}
