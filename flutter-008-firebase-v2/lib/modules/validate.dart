import 'package:flutter/widgets.dart';

class CheckValidate {
  String? emailChect({
    required String email,
    required FocusNode focusNode,
  }) {
    if (email.isEmpty) {
      // 빈값이면 포커스를 주는 코드
      focusNode.requestFocus();
      return "이메일을 입력해 주세요";
    } else {
      // 여기서 가져옴 https://github.com/callor/Reference/blob/master/markdown/JS%EC%A0%95%EA%B7%9C%EC%8B%9D.md
      // reference에서 가져온 이메일 정규식. r"" 로 감싸고 앞에/ 랑 뒤에/i; 삭제
      const pattern =
          r"^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
      // pattern을 컴파일
      var regExp = RegExp(pattern);
      if (!regExp.hasMatch(email)) {
        focusNode.requestFocus();
        return "이메일 형식이 잘못되었습니다";
      }
    }
    return "";
  }

  String? passwordCheck({
    required String password,
    required FocusNode focusNode,
  }) {
    if (password.isEmpty) {
      focusNode.requestFocus();
    } else {
      // 여기서 가져옴 https://github.com/callor/Reference/blob/master/markdown/JS%EC%A0%95%EA%B7%9C%EC%8B%9D.md
      // 앞에 r붙이고 /빼고 뒤에 /; 뻄
      const pattern =
          r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
      var regExp = RegExp(pattern);
      if (!regExp.hasMatch(password)) {
        focusNode.requestFocus();
        return "비밀번호는 특수문자, 영문자, 숫자 포함해 8~15자리로 입력";
      }
    }
    return "";
  }
}
