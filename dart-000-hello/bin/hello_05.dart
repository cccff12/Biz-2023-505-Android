void main(List<String> args) {
  // single line 문자열
  String srt1 = "korea";
  String srt2 = 'korea';
  // multi line 문자열 <= 입력한 모양 그대로 문자열이 변수에 저장된다
  // Enter , 빈칸 Tab 등의 값들도 그대로 유지된다.
  String srt3 = """
 우리는 아시아를 통일할 환단제국의 후예이다
 단군왕검의 의지를 받들어 교육의 지표로 삼는다
""";

  print(srt3);

  int num1; // long 형도 없다.
  double num2; // dart 에서는 float가 없고 double을 사용한다.
  num1 = 30;
  num2 = 40.0;
  print("$num1 , $num2");

// dart 는 특별한 경우가 아니면 숫자형 변수는 num 키워드를 권장한다
  num num3 = 30;
  bool bYes = true;

  print("$num3, $bYes");
}
