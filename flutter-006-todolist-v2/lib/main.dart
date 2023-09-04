import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const StartPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.blueAccent));
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  var todoList = [];

  // var todoList = [
  //   Todo(
  //     // 이걸 위해intl.dart 을 설치해야 함
  //     sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //     stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //     content: "오늘은 금요일",
  //     complete: false,
  //   ),
  //   Todo(
  //     sdate: "2023-09-01",
  //     stime: "10:35:10",
  //     content: "flutter 오늘은 토요일",
  //     complete: false,
  //   )
  // ];

  // 여기부터 리스트
  final List<String> list1 = ["1654", "156", "45"];

  ListView listView() => ListView.builder(
        itemCount: list1.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list1[index]),
          );
        },
      );
// 여기까지 리스트

  Todo getTodo(String context) => Todo(
        sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        stime: DateFormat("HH:ss:mm").format(DateTime.now()),
        content: context,
        complete: false,
      );

  Widget alertDialog(BuildContext context) => AlertDialog(
        actions: [
          TextField(
            // 키보드에 @ 글자 추가 뒤에 .emailAddress 는 바꿀수 있음 .number로 할 경우
            // 숫자 입력 가능
            keyboardType: TextInputType.emailAddress,
            // 검색하기 기능 뒤에 .search는 아이콘 모양으로 얼마든지 바꿀수 있음
            textInputAction: TextInputAction.search,
            // alert 에 입력한 값이 밑에 뜸
            onSubmitted: (value) {
              var snackBar = SnackBar(
                content: Text("$value 가 추가 되었음"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              var todo = getTodo(value);
              Navigator.of(context).pop();
              setState(() {
                todoList.add(todo);
              });
            },
            // alert에 나올 글자
            decoration: const InputDecoration(hintText: "hintext가 들어가는 곳"),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    // state 클래스 내의 함수를 실행해 결과를 가져온 후 todoList를 만든다
    // 이때 클래스 내의 함수를 호출하여 다른 변수를 만드는 경우
    // 이 코드는 build 함수 내부에서 실행해야 한다.

    return Scaffold(
      // appBar 시작
      appBar: AppBar(
        // 이미지를 박스에 넣음 pubspec 에서 수정 필요
        leading: Image.asset(
          "images/profile.jpg",
          // 이미지비율을 box에 맞춤
          fit: BoxFit.fill,
        ),
        title: const Text("나의 todo 리스트 app바에 들어가는 거"),
        // 아이콘 버튼
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => alertDialog(context),
                );
              },
              icon: const Icon(Icons.add_alert_outlined))
        ],
      ),
      // 화면에 표시할 리스트 시작
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            // 클릭했을 때 반응
            onTap: () {},
            selectedColor:
                const Color.fromARGB(255, 255, 255, 123).withOpacity(0.5),
            splashColor: const Color.fromARGB(255, 255, 129, 25).withOpacity(1),
            //  Dismissible : 제스처(여기서는 좌우)를 통해 항목을 제거할 수 있는 위젯
            title: Dismissible(
              key: Key(todoList[index].content),
              background: Container(
                color: Colors.amber,
                child: const Center(child: Text("살고싶어")),
              ),
              // Dismissible 실행 후에 할것 () 안에(매개변수)가 반드시 필요하다
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Column(
                      // 왼쪽에 Column 붙이기
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // 내용 추가
                      children: [
                        Text(todoList[index].sdate),
                        Text(todoList[index].stime),
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        todoList[index].content,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.amber),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
