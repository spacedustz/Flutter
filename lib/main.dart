import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen2(),
    );
  }
}

/**
 * StatelessWidget을 상속한 MainScreen Widjet
 */
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('어플리케이션'),),
      body: Text('안녕하세요'),
    );
  }
}

/**
 * StatefulWidget을 구현한 MainScreen2
 */
class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

// Spring의 PostConstructor 같은 느낌의 initState를 이용해 Body의 문구를 3초 후 바꿈 -> 상태 변경
class _MainScreen2State extends State<MainScreen2> {
  String title = '어플리케이션';
  String msg = '안녕하세요';

  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        msg = '안녕하세요2';
        title = '어플리케이션2';
      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Text(msg),
    );
  }
}




