import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ㅎㅇㅎㅇㅎㅇ"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("김갑수"),
              accountEmail: const Text(
                "아아.. 이건 이메일이라는 것이다",
                style: TextStyle(fontSize: 20),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("images/hios_image.webp")),
                    const Text(
                      "아아...이건 아이디라는 것이다",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text("아아.. 이건 전체 메일 보기라는 것이다.."),
              leading: Icon(Icons.email_outlined),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("아아..이것은 받은 메일함 이라는 것이다.."),
              leading: Icon(Icons.inbox),
            ),
            const ListTile(
              title: Text("아아..이것은 페이스북이라는 것이다.."),
              leading: Icon(Icons.facebook),
            ),
            const ListTile(
              title: Text("아아.. 이것은 안드로이드라는 것이다.."),
              leading: Icon(Icons.adb),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.add),
          label: const Text(
            "아아..이것은 추가라는 것이다",
            style: TextStyle(color: Colors.lightGreenAccent),
          ),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue),
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: 15, color: Colors.purpleAccent),
            ),
          ),
        ),
        ElevatedButton.icon(
            onPressed: () => {},
            icon: const Icon(Icons.clear),
            label: const Text(
              "아아 이것은 삭제라는 것이다..",
              style: TextStyle(color: Colors.black),
            )),
      ],
      body: const Center(
        child: Text(
          "아아..이건 나의 스마트 어플이라는 것이다",
          style: TextStyle(
              fontSize: 50, fontStyle: FontStyle.italic, color: Colors.amber),
        ),
      ),
    );
  }
}
