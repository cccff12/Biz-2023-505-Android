import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state/main_app_bar.dart';
import 'package:state/models/student.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      title: "Flutter State",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const HomePage(),
    );
  }
}

/// State 클래스를 관리하는 부모 클래스
/// State를 생성 한다
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  /// => StartPage()
  /// StartPage class 의 생성자를 호출하여 StartPage 의 객체를 생성해
  /// return하라
  @override
  State<StatefulWidget> createState() => StartPage();
}

/// State Widget에서는 StatefulWidget 과 관계를 명확하게 하기 위해
/// Generic(<HomePage>를 연결시켜준다)

class StartPage extends State<HomePage> {
  /// State 클래스 위젯에서 titles 배열 변수를 생성(선언과 초기화)
  /// 이 순간 titles는 state가 된다.
  /// state는 화면 랜더링, 또는 동적인 활동을 감시할 수 있는 동적 변수이다
  List<String> titles = [
    "아아..이것은 배열1 이라는 것이다..",
    "아아..이것은 배열2 이라는 것이다..",
    "아아..이것은 배열3 이라는 것이다..",
    "아아..이것은 배열4 이라는 것이다..",
    "아아..이것은 배열5 이라는 것이다..",
    "아아..이것은 배열6 이라는 것이다..",
  ];

  final studentList = [
    Student(stNum: "001", stName: "홍길동"),
    Student(stNum: "002", stName: "홍길동2"),
    Student(stNum: "003", stName: "홍길동3"),
    Student(stNum: "004", stName: "홍길동4"),
    Student(stNum: "005", stName: "홍길동5"),
  ];
  List<Student> filterList = [];

  /// 동적으로 변화되는 배열 요소들을 화면에 출력하기 위하여
  /// ListView.builder() 함수를 사용하여 각 요소를 디자인한다
  ListView appBarBody() => ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Material(
              child: InkWell(
                onTap: () {
                  var snackBar =
                      SnackBar(content: Text(filterList[index].stName));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                highlightColor:
                    const Color.fromARGB(255, 221, 207, 3).withOpacity(1),
                splashColor:
                    const Color.fromARGB(255, 0, 158, 250).withOpacity(1),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(filterList[index].stNum ?? ""),
                      Text(filterList[index].stName),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
// 매개변수(입력값)이 studentList 에 있다면 리스트를 가져오고 없으면 result 에 studentList를
// 저장한다
  void _onChangeHandler(String search) {
    List<Student> result = [];
    if (search.isNotEmpty) {
      result =
          studentList.where((item) => item.stName.contains(search)).toList();
    } else {
      result = studentList;
    }
    setState(() {
      filterList = result;
    });
  }

  /// state가 최초에 mount될 때(처음에 랜더링이 완료됐을 떄)
  @override
  void initState() {
    filterList = studentList;
    super.initState();
  }

// state가 unmount될 때
// 일부 context에 저장된 변수들을 사용해제 해야 할 경우가 있는데
// 이 때 여기에 그러한 코드를 작성한다
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("타이틀"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              var rnd = Random().nextDouble();

              /// flutter의 State 클래스에서 기본으로 제공하는 함수
              /// state로 선언된 변수의 값을 변경할 때 사용하는 함수
              /// 이 함수내의 본문에서 state 변수의 값(상태)을 변경하면
              /// 화면에 저동으로 랜더링이 된다

              setState(() {
                titles.add(rnd.toString());
              });
            },
            icon: const Icon(Icons.add_moderator),
          )
        ],
      ), //mainAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _onChangeHandler(value),
              decoration: const InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.amber),
                  hintText: "검색어를 입력해",
                  hintStyle: TextStyle(color: Colors.amber),
                  suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 50,
            ),
            //ListView 를 사용하여 list 보이기
            //Expanded 를 실행해 Column box 에 가득차게 구현
            Expanded(
              child: filterList.isNotEmpty
                  ? appBarBody()
                  : const Text(
                      "없는데요?",
                      style: TextStyle(fontSize: 25),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
