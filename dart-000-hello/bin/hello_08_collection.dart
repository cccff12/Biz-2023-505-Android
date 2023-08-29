// dart 에서는 이 배열을 list로 본다
var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
var nations = ["rok", "usa", "brith", "germany"];
List<String> names = ["홍", "성", "이"];

void main(List<String> args) {
  nums.add(100);
  nations.add("swice");
  names.add("Mr.im");
  print(nums);
  print(nations);
  print(names);

// List (배열) 에서 특정 값 제거하기
  nations.remove("usa"); // 없는거 넣으면 걍 유지됨
  print(nations);
  // list 의 3번 요소를 제거하라
  nations.removeAt(3);
  print(nations);
  print(names.first); //첫요소 출력
  print(names.last); //마지막요소 출력
  print(names.reversed); //순서 뒤집기
  names.shuffle(); // list를 랜덤하게 섞기

  /// 위 아래는 같은 값
  var result = names.first;
  print(names.first); //첫요소 출력
  result = names.last;
  print(names.last); //마지막요소 출력
  var iter = names.reversed;
  print(names.reversed); //순서 뒤집기
  names.shuffle();
  print(names);
}
