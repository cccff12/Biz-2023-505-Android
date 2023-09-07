// ignore_for_file: use_build_context_synchronously

import 'package:firebase/modules/validate.dart';
import 'package:firebase/pages/join_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../modules/input_form_field.dart';

class LoginPage extends StatefulWidget {
  // 여기 state를 변경하는 함수를 매개변수로 전달받았다.
  const LoginPage({super.key, required this.updateAuthUser});

// State<> 클래스 위젯에 함수를 전달하기 위해 선언된 함수 하고 위에 매개변수 ㅅ구정함
  final Function(User? user) updateAuthUser;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("login"),
      ),
      // Form을 Padding으로 감싸면 화면 넘어서 빗금 생기는걸 방지함
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputFormField(
                  focusNode: _emailFocus,
                  validator: (value) => CheckValidate()
                      .emailChect(email: value!, focusNode: _emailFocus),
                  setValue: (value) => _emailValue = value,
                  hintText: "hintText 이메일",
                  helpText: "helpText 이메일형식 맞춰야함"),
              inputFormField(
                // 위에 설정한 변수- 아이디 추가
                focusNode: _passwordFocus,
                hintText: "hintText 비밀번호",
                helpText: "helpText 비밀번호 틀수문자 영문자 숫자포함  8자 이상",
                setValue: (value) => _passwordValue = value,
                validator: (value) => CheckValidate().passwordCheck(
                  password: value!,
                  focusNode: _passwordFocus,
                ),
              ),
              // 로그인 버튼
              loginButton(),
              // 회원가입 버튼
              joinButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget joinButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        // 버튼을 누르면 modules/validate.dart의 validate() 가 실행되고 유효성 검사 실행됨
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          _formKey.currentState?.validate();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  JoinPage(updateAuthUser: widget.updateAuthUser),
            ),
          );
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            "회원가입 ElevatedButton",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        // 버튼을 누르면 modules/validate.dart의 validate() 가 실행되고 유효성 검사 실행됨
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          _formKey.currentState?.validate();
          var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
            // 이 두개를 이렇게 바꿔주면 입력한 값으로 로그인 됨
            email: _emailValue,
            password: _passwordValue,
          );
          // result.user !=null? true : false
          // Navigator.pop(context,데이터) : 현재 화면이 닫힐 떄
          // 현재 화면을 열었던 곳으로 데이터를 return
          Navigator.pop(context, result.user != null);
          await widget.updateAuthUser(result.user);
          // updateAuth가 이미 state변경 함수라 필요없다
          // setState(() {});
          Navigator.pop(context);
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            "로그인 ElevatedButton",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

//  Widget을 return하는 method
}
