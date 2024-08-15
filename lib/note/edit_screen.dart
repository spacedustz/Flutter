import 'package:flutter/material.dart';
import 'package:flutter_ex/database/database_helper.dart';

import 'data/note_info.dart';

/* NoteInfo를 받아 Appbar만 다르게 설정, Null이면 등록, 아니면 수정 화면 */
class EditScreen extends StatefulWidget {
  NoteInfo? data;

  EditScreen({super.key, this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final DB = DatabaseHelper();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController motiveController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  int priorityPoint = 0;
  List<bool> isClickedList = [false, false, false, false, false];

  void onPointClicked(int index) {
    setState(() {
      if (isClickedList[index]) {
        isClickedList[index] = false;
        priorityPoint = 0;
      } else {
        for (int i = 0; i < isClickedList.length; i++) {
          isClickedList[i] = false;
        }

        isClickedList[index] = true;
        priorityPoint = index + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            color: Colors.black,
          ),
          onTap: () {
            // 백 버튼 처리
            Navigator.pop(context);
          },
        ),
        title: Text(
          '새 아이디어 작성하기',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('제목'),
              buildTextField(
                  height: 50,
                  maxLength: 15,
                  maxLines: 1,
                  action: TextInputAction.next,
                  hintText: '아이디어 제목',
                  controller: titleController),
              buildSpacing(),

              Text('아이디어를 떠올린 계기'),
              buildTextField(
                  height: 50,
                  maxLength: 15,
                  maxLines: 1,
                  action: TextInputAction.next,
                  hintText: '아이디어를 떠올린 계기',
                  controller: motiveController),
              buildSpacing(),

              Text('아이디어 내용'),
              buildTextField(
                  vertical: 16,
                  maxLength: 500,
                  maxLines: 5,
                  hintText: '떠오른 아이디어를 작성해 주세요.',
                  controller: contentController),
              buildSpacing(),

              Text('아이디어 중요도 점수'),
              point(),
              buildSpacing(),

              Text('유저 피드백 사항 (선택)'),
              buildTextField(
                  vertical: 16,
                  maxLength: 500,
                  maxLines: 5,
                  hintText: '떠오르신 아이디어 기반으로\n전달받은 피드백들을 정리해주세요.',
                  controller: feedbackController),
              buildSpacing(),

              // 작성 완료 버튼
              GestureDetector(
                onTap : () async {
                  // DB Insert
                  String titleValue = titleController.text.toString();
                  String motiveValue = motiveController.text.toString();
                  String contentValue = contentController.text.toString();
                  String feedbackValue = feedbackController.text.toString(); // 선택 입력 사항

                  // 유효성 검사
                  if (titleValue.isEmpty || motiveValue.isEmpty || contentValue.isEmpty) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('비어있는 값이 존재합니다.'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                    return;
                  }

                  // Data 객체 생성 후 Save
                  if (widget.data == null) {
                    var info = NoteInfo(title: titleValue, motive: motiveValue, content: contentValue, priority: priorityPoint, feedback: feedbackValue.isNotEmpty ? feedbackValue : '', createdAt: DateTime.now().millisecondsSinceEpoch,);

                    await DB.initDatabase();
                    await DB.insertIdeaInfo(info);

                    if (mounted) Navigator.pop(context);
                  }

                },
                child: Container(
                  height: 65,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white),
                  child: Text('아이디어 작성 완료'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget point() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () {
              onPointClicked(index);
            },
            child: pointContainer(
              number: '${index + 1}',
              isClicked: isClickedList[index],
            ),
          );
        }),
      ),
    );
  }

  Widget pointContainer({required String number, bool? isClicked}) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 40,
      decoration: ShapeDecoration(
        color: (isClicked ?? false) ? Color(0xffd6d6d6) : Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        number,
        style: TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildTextField({
    double? height,
    double? vertical,
    int? maxLines,
    int? maxLength,
    TextInputAction? action,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: height,
      child: TextField(
        textInputAction: action,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: vertical ?? 10, horizontal: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffd9d9d9),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xffb4b4b4),
          ),
        ),
        style: TextStyle(fontSize: 12, color: Colors.black),
        controller: controller,
      ),
    );
  }

  Widget buildSpacing({double height = 16.0}) {
    return SizedBox(height: height);
  }
}
