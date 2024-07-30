import 'package:flutter/material.dart';

class MainSc extends StatefulWidget {
  const MainSc({super.key});

  @override
  State<MainSc> createState() => _MainScState();
}

class _MainScState extends State<MainSc> {
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

class SubSc extends StatelessWidget {
  String msg;

  SubSc({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('서브 화면'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('서브 화면 입니다. $msg'),
          ),
          TextButton(onPressed: () {
            Navigator.pop(context); // 현재 화면 제거
          }, child: Text('뒤로 가기'))
        ],
      ),
    );
  }
}
