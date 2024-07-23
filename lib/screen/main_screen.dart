import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('이건'),
                Text('세로축인 Row Widget')],
            ),
            Row(
              children: [
                Expanded(flex: 2, child: Text('홍길동')),
                Expanded(child: Text('홍길동')),
                Expanded(child: Text('홍길동')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
