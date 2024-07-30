import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  String msg;

  TabBarWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            '서브 화면',
            style: TextStyle(color: Colors.black),
          ),
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '뒤로 가기',
                style: TextStyle(color: Colors.black),
              )),
          actions: [
            Icon(
              Icons.ac_unit_outlined,
              color: Colors.black,
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Tab 1',
              ),
              Tab(
                text: 'Tab 2',
              ),
              Tab(
                text: 'Tab 3',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Tab 1 내용'),
            ),
            Center(
              child: Text('Tab 2 내용'),
            ),
            Center(
              child: Text('Tab 3 내용'),
            ),
          ],
        ),
      ),
    );
  }
}
