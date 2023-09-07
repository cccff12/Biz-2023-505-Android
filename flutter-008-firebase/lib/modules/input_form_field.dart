import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget inputFormField({
  required FocusNode focusNode, // 반드시전달
  required Function(String) setValue, // 반드시전달
  // String 이라는 매개변수가 null인 경우, String 이 null인 경우
  required Function(String?) validator, // 선택적
  String? hintText, // 선택적전달
  String? helpText, // 선택적전달
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      // 위에 설정한 변수- 아이디 추가
      focusNode: focusNode,
      // value 값을 받아서 보내는 것이기 떄문에 null값이 있어서는안된다. 그래서 함수 위에 물음표
      validator: (value) => validator(value),
      onChanged: (value) => setValue(value),
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helpText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    ),
  );
}
