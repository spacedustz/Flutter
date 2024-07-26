import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget({super.key});

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('메인화면'),
        ),
        body: Container( // 버튼의 크기를 늘리기 위한 컨테이너
          alignment: Alignment.center,
          // width: 200,
          // height: 100,
          margin: EdgeInsets.all(32),

          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print('버튼이 클리 되었습니다.');
                  },
                  style: ElevatedButton.styleFrom( // 버튼 스타일
                      backgroundColor: Colors.white, // 배경색
                      foregroundColor: Colors.black, // 글자색
                      elevation: 10 // 그림자
                  ),
                  child: Text('버튼 누르기'))
            ],
          ),
        ));
  }
}