import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  // 사용자의 입력을 컨트롤러가 받음
  TextEditingController idController = TextEditingController();

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
                print(idController.text.toString());
              },
              child: Text('아이디 입력값 가져오기!'))
        ],
      ),
    );
  }
}