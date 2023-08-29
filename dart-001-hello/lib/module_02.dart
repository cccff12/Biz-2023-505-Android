// 위치기반 함수 -> 받을때 순서를 바꾼다면 오류난다
String sayHello(String? name, int? age, String? nation) =>
    "안녕 $name 야 당신의 나이는 $age 고, 고향은 $nation 이야";
// 이름기반 함수 => 받을때 순서가 틀려도 된다.
String sayHelloNameParams({String? name, int? age, String? nation}) =>
    "이름: $name 나이: $age 고향 $nation";

/// <span name="홍길동", age=33, nation="대한민국"/>
/// 바로 위 코드는 const Span =({name, nation, age})=>{return<></>}