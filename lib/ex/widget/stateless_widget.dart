import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatelessEx extends StatelessWidget {
  const StatelessEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('어플리케이션'),),
      body: Text('안녕하세요'),
    );
  }
}