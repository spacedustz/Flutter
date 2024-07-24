import 'package:flutter/material.dart';

class ContainerSizedBoxWidget extends StatelessWidget {
  const ContainerSizedBoxWidget({super.key});

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
              width: 300,
              height: 100,
              margin: EdgeInsets.all(32), // margin 32 전체 margin에 적용
              // margin: EdgeInsets.only(left: 10,right: 0, top: 0, bottom: 0) // 원하는 margin 방향만 지정 가능
              alignment: Alignment.center, // Text 중앙으로
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueAccent,),
              child: Text('Container'),
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: Text('Sized Box'),
            )
          ],
        ),
      ),
    );
  }
}
