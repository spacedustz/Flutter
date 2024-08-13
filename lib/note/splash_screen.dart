import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 시작화면이 뜨고 3초 후 메인 화면으로 자동 이동 -> Replacement를 사용해 시작 화면을 남아있지 않게 함
    Future.delayed(
      Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, '/main');
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 주축 기준 정렬
          children: [
            Image.asset(
              'assets/note/light.png', // 이미지 삽입
              width: 180,
              height: 180,
            ),
            Container( // 위로 margin 32주고 Text 삽입
              margin: EdgeInsets.only(top: 32),
              child: Text(
                'Archive Idea',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
