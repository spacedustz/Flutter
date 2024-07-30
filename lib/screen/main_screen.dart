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
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              // Text Button을 만들면 기본적으로 파란색 링크처럼 표시 됨
              // 버튼 클릭 시 /sub 화면을 생성하면서 이동
              Navigator.pushNamed(context, '/sub', arguments: 'Hello');

              // 현재 내 화면과 교체하면서 이동
              // Navigator.pushReplacementNamed(context, '/sub');
            },
            child: Text('서브 화면으로 이동'),
          ),
        ],
      ),
    );
  }
}
