import 'package:dart_hello/module_02.dart';

void main(List<String> args) {
// 위치기반 함수호출
// sayHello() 함수를 호출하면서 3개의 값을 전달한다.
// 이때 sayHello() 함수에 선언된 3개의 매개변수에 순서대로 값이 저장되어
// 전달된다.

// 위치기반 함수를 받은 것
  var result = sayHello("홍길동", 22, "대한민국");
  print(result);

// 이름기반 함수를 받은 것
  /// named patameter 방식
  /// 함수를 선언할 떄매개변수를 {}로 감싸주고
  /// 값을 전달할때 변수:값 형식으로전달한다
  /// 위치기반에 비하여 함수에 값이잘못 전달되는 것을 방지할 수 있다.

  result = sayHelloNameParams(age: 33, nation: "조선민주주의공화국", name: "성춘향");
  print(result);

  // named parameter 방식의 함수를 선언할 때 변수 type 에 null safe(?) 를
  // 지정하면 변수값을 안보내도 된다
  // 이런 방식을 Optional Parameter 라고 한다.
  result = sayHelloNameParams(name: "dl");
  print(result);
}
