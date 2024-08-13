import 'package:flutter/material.dart';

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
        '/': (context) => SplashScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
