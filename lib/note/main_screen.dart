import 'package:flutter/material.dart';
import 'package:flutter_ex/database/database_helper.dart';
import 'package:flutter_ex/note/data/note_info.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var dbHelper = DatabaseHelper();
  List<NoteInfo> list = [];

  @override
  void initState() {
    super.initState();
    // 더미 데이터 삽입
    // setDummy();

    getIdeaInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // 그림자 제거
        title: Text(
          'Archive Idea',
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: list.length, // 리스트 항목의 수
          itemBuilder: (context, index) {
            return GestureDetector(
              child: listItem(index),
              onTap: () async {
                var result = await Navigator.pushNamed(context, '/detail',
                    arguments: list[index]);

                if (result != null) {
                  String msg = '';

                  if (result == 'edit') {
                    msg = '아이디어가 수정 되었습니다.';
                  } else if (result == 'insert') {
                    msg = '아이디어가 삭제 되었습니다.';
                  }

                  // Refresh List
                  getIdeaInfo();

                  // Show SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(msg),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
      // 아이디어를 생성하는 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.pushNamed(context, '/edit');

          if (result != null) {
            getIdeaInfo();

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('새로운 아이디어가 추가 되었습니다!'),
                ),
              );
            }
          }
        },
        child: Image.asset(
          'assets/note/light.png',
          width: 48,
          height: 48,
        ),
        backgroundColor: Color(0xff7f52fd).withOpacity(0.7), // 백그라운드 버튼 색, 투명도
      ),
    );
  }

  // List View 위젯 분리
  Widget listItem(int index) {
    return Container(
      height: 82, // 각 항목의 높이 설정
      margin: EdgeInsets.only(top: 16), // 위쪽 마진 10 추가
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xffd9d9d9), width: 1),
        // 외곽 선 회색으로 설정
        borderRadius: BorderRadius.circular(10),
      )),

      // Stack은 사용해 여러 위젯을 겹쳐서 배치도 가능함
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // 아아디어 제목
          Container(
            margin: EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              list[index].title,
              style: TextStyle(fontSize: 16),
            ),
          ),

          // 일시
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 16, bottom: 8),
              child: Text(
                DateFormat("yyyy.MM.dd HH:mm").format(
                    DateTime.fromMillisecondsSinceEpoch(list[index].createdAt)),
                style: TextStyle(
                  color: Color(0xffaeaeae),
                  fontSize: 10,
                ),
              ),
            ),
          ),

          // 아이디어 중요도 (별 표시)
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 16, bottom: 8),
              child: RatingBar.builder(
                initialRating: list[index].priority.toDouble(),
                // 초기 별 점수
                minRating: 1,
                // 최소 별 개수
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 16,
                itemPadding: EdgeInsets.symmetric(horizontal: 0),

                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                ignoreGestures: true,
                updateOnDrag: false,
                onRatingUpdate: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* 아이디어 목록 조회 */
  Future<void> getIdeaInfo() async {
    await dbHelper.initDatabase();
    list = await dbHelper.getAll();

    // 최신 글이 위로 오게끔 역순으로 정렬
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    // 리스트 갱신 (UI 업데이트)
    setState(() {});
  }

  Future<void> setDummy() async {
    var idea = NoteInfo(
        title: '환경보존 문제해결 앱 아이디어',
        motive: '길가다가 쓰레그를 주우며 생각남',
        content: '... 내용 ...',
        priority: 5,
        feedback: '유저 피드백 ㅇㅇㅇ',
        createdAt: DateTime.now().millisecondsSinceEpoch);

    await dbHelper.initDatabase();
    await dbHelper.insertIdeaInfo(idea);
  }
}
