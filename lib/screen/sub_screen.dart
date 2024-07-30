import 'package:flutter/material.dart';

class SubScreen extends StatelessWidget {
  String msg;

  SubScreen({super.key, required this.msg});

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
