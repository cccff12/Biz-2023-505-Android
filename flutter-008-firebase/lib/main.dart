import 'package:firebase/firebase_options.dart';
import 'package:firebase/pages/mypage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  /// Android , IOS 의 장치를 통해 외부 네트워크를 실행하거나
  /// 장치에 부착된 카메라 GPS 등에 접근하기 위해
  /// Flutter와 Naritive를 연결하는 설정
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // _aythUser state 선언
  late User? _authUser;

  @override
  void initState() {
    // login된 사용자 정보를 firebaseAuth에게 요청해 _authUser에 담음
    super.initState();
    _authUser = FirebaseAuth.instance.currentUser;
  }

// 이게 부모에서 만든 state 변경 함수 이걸 login으로 전달할거다
  void updateAuthUser(User? user) {
    setState(() {
      _authUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("firebase project")),
      //  로그인된 정보가 있으면 ElevatedButton 로그아웃을 보여준다 기능은 써진것과 같음
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "반갑습니다",
            style: TextStyle(fontSize: 35),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyPage(
                      authUser: _authUser,
                      updateAuthUser: updateAuthUser,
                    ),
                  ),
                );
              },
              child: const Text("ElevatedButton 마이페이지"))
        ],
      )),
    );
  }
}
