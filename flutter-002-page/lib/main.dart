import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  /// 스마트폰 어플을 만들기 위해서 가장 바깥쪽의 box를 설정하는데
  /// MaterialApp() 이라는 Widget 을 사용한다
  /// MaterialApp() 은 home이라는 Named Parameter 를 가지고 있고
  /// 이 home은 매개변수에 어떤 Widget 을 부착해 화면을 그리도록 한다
  /// MaterialApp()은 스마트 기기에서 어플이 시작되도록 context를 구현하는
  /// Widget 도구이다. 실제로 이 Widget이 하는 일은 화면에 무엇인가 나타내는
  /// 것이 아니다
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

// 여기서부터 화면에 무엇인가 나타나는 코드가 시작된다.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => StartPage();
}

class StartPage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("data"),
    );
  }
}
