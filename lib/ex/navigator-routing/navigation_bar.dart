import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  String msg;

  NavigationBar({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('서브 화면', style: TextStyle(color: Colors.white),),
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '뒤로 가기',
              style: TextStyle(color: Colors.white),
            )),
        actions: [
          Icon(Icons.ac_unit_outlined, color: Colors.white,),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text('서브 화면 입니다. $msg'),
          ),
        ],
      ),
    );
  }
}