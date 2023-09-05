import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPage();
}

class _EmailPage extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    // 키 값인데 dynamic은 어떤 값이든 받을 수 있다.
    // ModalRoute 객체로부터 설정값(setting ) 을 getter 하고
    // 설정값들 중에서 arguments 값을 getter 하여 args 에 Map type으로 담아라
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("emailPage"),
      ),
      body: Center(
          child: Column(
        children: [
          const Text("dsdsd"),
          Text("Email ${args["email"]}"),
          Text("Email ${args["password"]}"),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed("/mypage"),
              child: const Text("My Page"))
        ],
      )),
    );
  }
}
