// lib 폴더에 저장된 가른 dart 파일을 import
import 'package:dart_hello/module_01.dart';

void main(List<String> args) {
  var num1 = 30;
  var num2 = 40;
  var korea = "대한민군";
  var nums = [23, 13, 15, 13, 1, 31, 3, 136, 513];

  print(nation(korea));
  var result = addNums(num1, num2);
  print("결과 : $result");

  result = sumNums(nums);
  print("결과 : $result");
}
