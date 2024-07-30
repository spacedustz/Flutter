import 'package:flutter/material.dart';
import 'package:flutter_ex/screen/main_screen.dart';
import 'package:flutter_ex/screen/splash_screen.dart';
import 'package:flutter_ex/screen/sub_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/main': (context) => MainScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/sub') {
          // Navigator에서 넘겨준 'hello' 값을 타입 캐스팅해서 받음
          String msg = settings.arguments as String;

          return MaterialPageRoute(
            builder: (context) {
              return SubScreen(
                msg: msg,
              );
            },
          );
        }
      },
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
    );
  }
}

/* -------------------- Stateless & Stateful Widget 예시 코드 -------------------- */

// /**
//  * StatelessWidget을 상속한 MainScreen Widjet
//  */
// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('어플리케이션'),),
//       body: Text('안녕하세요'),
//     );
//   }
// }
//
// /**
//  * StatefulWidget을 구현한 MainScreen2
//  */
// class MainScreen2 extends StatefulWidget {
//   const MainScreen2({super.key});
//
//   @override
//   State<MainScreen2> createState() => _MainScreen2State();
// }
//
// // Spring의 PostConstructor 같은 느낌의 initState를 이용해 Body의 문구를 3초 후 바꿈 -> 상태 변경
// class _MainScreen2State extends State<MainScreen2> {
//   String title = '어플리케이션';
//   String msg = '안녕하세요';
//
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(Duration(seconds: 3), () {
//       setState(() {
//         msg = '안녕하세요2';
//         title = '어플리케이션2';
//       });
//     },);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title),),
//       body: Text(msg),
//     );
//   }
// }
