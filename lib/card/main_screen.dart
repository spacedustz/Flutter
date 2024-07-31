import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    getIntroduceData(); // 저장된 데이터 불러오기
  }

  TextEditingController introController = TextEditingController();
  bool isEditMode = false;

  Future<void> getIntroduceData() async {
    var sharedPref = await SharedPreferences.getInstance();
    String introduceMsg = sharedPref.getString('intro').toString();
    introController.text = introduceMsg ?? ""; // Nullish 연산자
  }

  Future<void> saveInputValues() async {
    print("saveInputValues 호출됨");
    if (introController.text.isEmpty) {
      var snackBar = SnackBar(content: Text('자기소개 입력값이 비어있습니다.'), duration: Duration(seconds: 2),);

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    var sharedPref = await SharedPreferences.getInstance();
    bool success = await sharedPref.setString('intro', introController.text);

    if (success) {
      print("자기소개 저장 성공");
    } else {
      print("자기소개 저장 실패");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // 배경색 흰색
        elevation: 0, // 그림자 없앰
        leading: Icon(
          Icons.accessibility_new,
          color: Colors.black,
          size: 32,
        ),
        title: Text(
          '개발자 신건우를 소개합니다',
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        // 세로형이기 떄문에 Column 사용
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 좌측 기준 정렬

          children: [
            /* 이미지 섹션 */
            Container(
              // 전체 Container margin 16
              margin: EdgeInsets.all(16),
              width: double.infinity,
              height: 250,

              // Border를 주려면 ClipRRect를 사용
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),

                // Image의 fit을 cover로 주면 비율을 맟추지 않음.
                child: Image.asset(
                  'assets/card/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /* 내 정보 섹션 */
            Container(
              // symmetric = 가로, 세로 규격
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

              child: Row(
                children: [
                  Container(
                      width: 150,
                      child: Text(
                        '이름',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    '신건우',
                  ),
                ],
              ),
            ),
            Container(
              // symmetric = 가로, 세로 규격
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

              child: Row(
                children: [
                  Container(
                      width: 150,
                      child: Text(
                        '나이',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    '99',
                  ),
                ],
              ),
            ),
            Container(
              // symmetric = 가로, 세로 규격
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

              child: Row(
                children: [
                  Container(
                      width: 150,
                      child: Text(
                        '취미',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    '가만히 있기',
                  ),
                ],
              ),
            ),
            Container(
              // symmetric = 가로, 세로 규격
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

              child: Row(
                children: [
                  Container(
                      width: 150,
                      child: Text(
                        '직업',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    '개발자',
                  ),
                ],
              ),
            ),
            Container(
              // symmetric = 가로, 세로 규격
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

              child: Row(
                children: [
                  Container(
                      width: 150,
                      child: Text(
                        '학력',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    'XX대학교 졸업',
                  ),
                ],
              ),
            ),
            Container(
              // symmetric = 가로, 세로 규격
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

              child: Row(
                children: [
                  Container(
                      width: 150,
                      child: Text(
                        'MBTI',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    'INTP',
                  ),
                ],
              ),
            ),

            /* 자기소개 섹션 */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                    '자기 소개',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                // 수정 버튼 처리
                GestureDetector(child: Container(
                  margin: EdgeInsets.only(right: 16, top: 16),
                  child: Icon(
                    Icons.mode_edit,
                    color: isEditMode == true ? Colors.blueAccent : Colors.black,
                    size: 24,
                  ),
                ), onTap: () {
                  if (isEditMode) saveInputValues();

                    setState(() {
                      isEditMode = !isEditMode;
                    });
                    print(isEditMode);
                },),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                maxLines: 5,
                controller: introController,

                // 활성화 - 비활성화
                enabled: isEditMode,

                // TextField Decoration
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xffd9d9d9),
                  ), // 태두라 가장 자리
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
