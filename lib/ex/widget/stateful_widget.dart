import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulEx extends StatefulWidget {
  const StatefulEx({super.key});

  @override
  State<StatefulEx> createState() => _StatefulExState();
}

// Spring의 PostConstructor 같은 느낌의 initState를 이용해 Body의 문구를 3초 후 바꿈 -> 상태 변경
class _StatefulExState extends State<StatefulEx> {
  String title = '어플리케이션';
  String msg = '안녕하세요';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        msg = '안녕하세요2';
        title = '어플리케이션2';
      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Text(msg),
    );
  }
}
