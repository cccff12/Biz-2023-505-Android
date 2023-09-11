// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/modules/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../modules/input_form_field.dart';

class JoinPage extends StatefulWidget {
  // 여기 state를 변경하는 함수를 매개변수로 전달받았다.
  const JoinPage({super.key, required this.updateAuthUser});

// State<> 클래스 위젯에 함수를 전달하기 위해 선언된 함수 하고 위에 매개변수 ㅅ구정함
  final Function(User? user) updateAuthUser;

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _nameFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  String _emailValue = "";
  String _passwordValue = "";
  String _nameValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 이메일
              inputFormField(
                  focusNode: _emailFocus,
                  validator: (value) => CheckValidate()
                      .emailChect(email: value!, focusNode: _emailFocus),
                  setValue: (value) => _emailValue = value,
                  hintText: "hintText 이메일",
                  helpText: "helpText 이메일형식 맞춰야함"),
              // 패스워드
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

              inputFormField(
                focusNode: _nameFocus,
                setValue: (value) => _nameValue = value,
                validator: (value) => null,
                hintText: "성명",
              ),

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

          try {
            // 로그인
            var result =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailValue,
              password: _passwordValue,
            );
            widget.updateAuthUser(result.user);
            // email password외에 정보를 저장할려면 fireStore에 저장해야한다
            // 저장하기 위해 cloud_firestore 설치
            // 그리고 firestore에 저장
            if (result.user != null) {
              await FirebaseFirestore.instance
                  .collection("user")
                  .doc(result.user!.uid)
                  .set({
                "email": result.user!.email,
                "name": _nameValue,
                "tel": "010-1111-1111"
              });
            }
          } on FirebaseException catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(e.message!),
            ));
          }
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

//  Widget을 return하는 method
}
