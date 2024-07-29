import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 사용자의 입력을 컨트롤러가 받음
  TextEditingController idController = TextEditingController();
  String stateMessage = '이 곳에 값이 업데이트 됩니다.';
  ValueNotifier<int> counter = ValueNotifier<int>(0); // 0으로 초기화

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인화면'),
      ),
      body: Column(
        children: [
          TextField(
            controller: idController,
            decoration: InputDecoration(labelText: '아이디를 입력해 주세요.'),
          ),
          // 버튼을 이용해 사용자의 입력값을 컨트롤러에서 가져와 Console에 찍기
          ElevatedButton(
            onPressed: () {
              // State가 변경되면 stateMessage 변수에 사용자의 입력값을 넣음
              setState(() {
                stateMessage = idController.text.toString();
              });

              counter.value = 30;
            },
            child: Text('아이디 입력값 가져오기!'),
          ),

          // 값을 지속적으로 Listen
          ValueListenableBuilder<int>(
            valueListenable: counter,
            builder: (context, value, child) {
              return Text('Count : $value');
            },
          ),
          Text(
            '사용자 입력값 = $stateMessage',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
