import 'package:firebase/modules/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login"),
      ),
      body: Form(
        // 위에 final _formKey 사용=> form을 state로 변화시키기 위한것
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                // 위에 설정한 변수- 아이디 추가
                focusNode: _emailFocus,
                validator: (value) => CheckValidate()
                    .emailChect(email: value!, focusNode: _emailFocus),
                decoration: const InputDecoration(
                  hintText: "이메일 입력 해라",
                  helperText: "이메일 형식 맞춰라 helperText",
                ),
              ),
              TextFormField(
                // 위에 설정한 변수- 아이디 추가
                focusNode: _passwordFocus,
                validator: (value) => CheckValidate()
                    .passwordCheck(password: value!, focusNode: _passwordFocus),
                decoration: const InputDecoration(
                  hintText: "비밀번호 입력 hinttext",
                  helperText: "특수 대소문자 숫자 포함해 8자 이상 helpertext",
                ),
              ),
              ElevatedButton(
                  // 버튼을 누르면 modules/validate.dart의 validate() 가 실행되고 유효성 검사 실행됨
                  onPressed: () async {
                    _formKey.currentState?.validate();
                    var result =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: "ksun0430@naver.com",
                      password: "!korea8080",
                    );
                    setState(() {});
                  },
                  child: const Text("로그인 ElevatedButton")),
            ],
          ),
        ),
      ),
    );
  }
}
