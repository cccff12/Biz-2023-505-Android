import 'package:firebase/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'page/login_page.dart';

// google login을 할거임
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // firebase가 inirializing 되지 않으면 안돼도록
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  // firebase auth를 통해 로그인된 사용자 정보를 담을 state변수
  late User? _authUser;

  /// State 초기화 함수에 firebase auth 를 통해 로그인된 사용자 정보를 가져와
  /// _authUser 변수에 담아둔다
  @override
  void initState() {
    super.initState();
    // 로그인된 정보를 가져와 담았음
    _authUser = FirebaseAuth.instance.currentUser;
  }

// _authUser state를 update할 함수
  void updateAuthUser(User? user) {
    setState(() {
      _authUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _authUser != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("로그인한 사용자 email: ${_authUser?.email}"),
                  Text("로그인시간 : ${_authUser?.metadata.lastSignInTime}"),
                  Text("아이디 생성시간: ${_authUser?.metadata.creationTime}"),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        setState(() {
                          updateAuthUser(null);
                        });
                      },
                      child: const Text("로그아웃"))
                ],
              ),
            )
          : SimpleDialog(title: const Text("로그인이 필요하다"), children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(updateAuthUser: updateAuthUser),
                  )),
                  child: const Text("로그인하기"),
                ),
              ),
            ]),
    );
  }
}
