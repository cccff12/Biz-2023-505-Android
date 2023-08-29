String stdFunc(String nation) {
  return nation.toUpperCase();
}

String arrowFunc(String nation) => nation.toUpperCase();

int stdSum(int num1, int num2) {
  int sum = num1 + num2;
  return sum;
}

// (String? name) = 매개변수는 null을 전달할 수 있다.
//  name?.toUpperCase() ?? null; name이 있다면 대문자로 바꾸고 없으면 null값을 return
// 다만 타입 을 설정할때 String? 이렇게 뒤에 ? 를 붙여야 한다.
String? arrowStrFunc(String? name) => name?.toUpperCase() ?? null;
String? stdNullFunc(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return null;
}

// 만약 없다면 NULL을 return할 수 없으니 not found라는 문자열 return
String arrowNotNullFunc(String? name) => name?.toUpperCase() ?? "NOT FOUND";
