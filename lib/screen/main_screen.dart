import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// Column-Row-Expanded Widget
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인화면'),
      ),
      body: Center(
        // child: Text('메인 화면 입니다.'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('안녕하세요.'),
            Text('개발자 신건우입니다.'),
            Container(
              color: Colors.lightBlueAccent,
              child: Text('컨테이너'),
            )
          ],
        ),
      ),
    );
  }
}
