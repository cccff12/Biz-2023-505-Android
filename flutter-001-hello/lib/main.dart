// material은 안드로이드테마

/// flutter 프로젝트를 열었을 떄 import 에서 오류가 발생한 경우
/// 프로젝트 폴더에서 flutter pub get 실행하기
import 'package:flutter/material.dart';

/// dart 프로젝트 시작점
void main(List<String> args) {
  MyApp app = const MyApp();
  runApp(app);
}

// MyApp이든 뭐가 됐건 StatelessWidget를 상속 받으면 build라는 Widget을 만들어야 한다
// flutter 로 생성한 app의 시작점
class MyApp extends StatelessWidget {
  // {super.key}는 MyApp 가 이미 만들어져 있어 가져온 것
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 앞이 대문자 함수면 생성자 함수
    return MaterialApp(
      title: "반갑습",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const StartPage(),
    );
  }
}

/// State 를 사용하여 화면에 지속적인 변화를 주기 위한 시작점
/// StatefullWidget 의 State 위젯을 생성, 컨트롤하는 위젯
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  // _StartPage 클래스의 생성자를 호출해 객체를 생성하는 코드
  State<StartPage> createState() => _StartPage();
}

/// StartPage(StatefullWidget) 가 생성하고 컨트롤할 State
/// 클래스 이름에 UnderScore(_)를 붙이면 이 클래스는 private 성질을 갖는다
/// 현재 버전의 dart 에서는 UnderScore()를 사용하지 말라 권장하는데,
/// flutter 의 State 클래스에는 통상 UnderScore() 붙여서 StatefullWedget의
/// 이름과 같이 만든다
class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("나의 첫 App")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("반가워요"),
            Text("반가워요"),
            Text("반가워요"),
            Text("반가워요"),
            Text("반가워요"),
            Text("반가워요"),
            Text("반가워요"),
            Text("반가워요"),
            Text("반가워요"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.email_outlined),
      ),
    );
  }
}
