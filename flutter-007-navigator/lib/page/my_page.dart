import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/page/user_input.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("mypage"),
      ),
      body: Center(
        child: Column(
          // 가운데로 옮기기
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Scaffold_body_Center_child_Text_myPage"),
            ElevatedButton(
              onPressed: () async {
                var userDto = User(
                  username: "mypage의 전달값",
                  password: "mypage의 전달값",
                  nickname: "mypage의 전달값",
                  email: "mypage의 전달값",
                  tel: "mypage의 전달값",
                );
                // 여기는 비동기 방식으로 전달하는게 좋음 데이터를 잃을 수 있으니
                var result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    // 뒤에 있는 userDto 를 userDto라는 이름으로 전달
                    builder: (context) => UserInput(userDto: userDto),
                  ),
                );
                var resultStr = """
                    username= ${result.username},
                    password= ${result.password},
                    nickname= ${result.nickname},
                  """;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(resultStr),
                    duration: const Duration(seconds: 5),
                  ),
                );
              },
              child: const Text("정보수정"),
            ),
          ],
        ),
      ),
    );
  }
}
