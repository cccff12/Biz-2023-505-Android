import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/page/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Scaffold_body_Center_child_Text_homePage"),
            ElevatedButton(
                onPressed: () {
                  var user = User(
                    username: "model의 이름",
                    password: "model의 비밀번호",
                    nickname: "model의 닉네임",
                    email: "model의 email",
                    tel: "model의 tel",
                  );
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(
                      name: "이름dsd",
                      email: "이메일sds",
                      userDto: user,
                    ),
                  ));
                },
                child: const Text("자세히 보기"))
          ],
        ),
      ),
    );
  }
}
