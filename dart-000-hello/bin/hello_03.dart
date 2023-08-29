void main(List<String> args) {
  // final로 선언된 변수는 변경이 불가능하다 . 만약 다른 값을 할당할려고 하면 오류가 발생한다

  final int num1 = 20;
  final int num2 = 30;
  var s = "ds";
  print("${num1 + num2} $s");
}
