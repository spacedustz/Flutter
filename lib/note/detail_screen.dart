import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../database/database_helper.dart';
import 'data/note_info.dart';

class DetailScreen extends StatelessWidget {
  NoteInfo? data;
  final DB = DatabaseHelper();

  DetailScreen({super.key, this.data});

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
            data!.title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('글 삭제'),
                      content: Text('아이디어를 삭제하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            '취소',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await deleteData(data!.id!);

                            if (context.mounted) {
                              Navigator.of(context).pop();
                              Navigator.pop(context, 'delete');
                            }
                          },
                          child: Text(
                            '삭제',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                '삭제',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* 아이디어를 떠올린 계기 */
                    Text(
                      '아이디어를 떠올린 계기',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data!.motive,
                      style: TextStyle(
                        color: Color(0xffa5a5a5),
                      ),
                    ),
                    SizedBox(height: 30,),

                    /* 아이디어 내용 */
                    Text(
                      '아이디어 내용',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data!.content,
                      style: TextStyle(
                        color: Color(0xffa5a5a5),
                      ),
                    ),
                    SizedBox(height: 30,),

                    /* 아이디어 중요도 점수 */
                    Text(
                      '아이디어 중요도 점수',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    RatingBar.builder(
                      initialRating: data!.priority.toDouble(),
                      // 초기 별 점수
                      minRating: 1,
                      // 최소 별 개수
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 35,
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
                    SizedBox(height: 30,),

                    /* 유저 피드백 사항 */
                    Text(
                      '유저 피드백 사항',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data!.feedback,
                      style: TextStyle(
                        color: Color(0xffa5a5a5),
                      ),
                    ),
                  ],
                ),
              ),
            ),),

            /* 내용 편집 버튼 */
            GestureDetector(
              onTap : () async {
                // 수정화면으로 이동
                var result = await Navigator.pushNamed(context, '/edit', arguments: data);

                if (result != null) {
                  if (context.mounted) {
                    Navigator.pop(context, 'edit');
                  }
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                child: Text('내용 편집하기'),
              ),
            ),
          ],
        ));
  }

  Future deleteData(int id) async {
    await DB.initDatabase();
    await DB.deleteIdea(id);
  }
}
