import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "data",
            //size는 단위가 없다이 크기는 pixel Ratio 값을 곱해 Pixel 로 표현한다
            // color를 지정하면 MaterialApp 에 Theme를 설정했을 경우
            // 실제 컬러와 다르게 보일 수 있다.
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/title_image.jpg",
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            titleSection,
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection()
          ],
        ),
      ),
    );
  }

// Widget변수 선언 바로 return됨
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "ㅎㅇ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "그레이색이야",
                style: TextStyle(
                  color: Color.fromARGB(255, 19, 174, 222),
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.switch_account,
          color: Colors.red,
        ),
        const Text("50")
      ],
    ),
  );

  /// 컨테이너 위젯
  /// Container : padding, margin 을 부여하는 box
  /// Expanded : 부모 box를 가득 채우는 구조의 box
  /// Padding : padding 을 기본값으로 갖는 box

// Widget함수 선언 - return 필요
  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      // margin: const EdgeInsets.all(20),
      child: const Text(
        "안뇽"
        "안뇽"
        "안뇽"
        "안뇽"
        "안뇽",
        // 글자를 1열로 나열
        softWrap: true,
      ),
    );
  }

  Widget colMethod() {
    return const Column(
      children: [
        Text(
          "ㅎㅇ1",
          style: TextStyle(fontSize: 30, color: Colors.deepOrange),
        ),
        Text(
          "ㅎㅇ2",
          style: TextStyle(fontSize: 30, color: Colors.deepOrange),
        ),
        Text(
          "ㅎㅇ3",
          style: TextStyle(fontSize: 30, color: Colors.deepOrange),
        ),
      ],
    );
  }
}
