# Biz-2023-505-Android

- Android Project
- @since 2023-08-28

## Flutter 설치

- 설치파일 다운로드 : `fluter.dev` 사이트에서 `Get Started` 에 접속하여 `flutter*.zip` 다운로드
- c:\dev 폴더에 파일 이동 후 압축 풀기
- 압축 해제된 폴더에서 `flutter` 폴더를 `c:\dev` 폴더로 이동
- window 의 고급설정보기에서 환경변수 path 항목에 `c:\dev\flutter\bin` 폴더 추가하기

## flutter extention 설치

- vsCode 의 확장 plugin 설치: flutter 검색해 설치

## flutter project 생성

```bash
# 베이스패키지는 com.callor 파일 이름은 hello로 프로젝트생성
flutter create --org=com.callor hello
# 이렇게 하면 패키지 이름도 이렇게 바뀌어서 위대로 만드는게 낫다
flutter create --org=com.callor flutter-000-hello-01
```

## 프로젝트 명명 주의

- 만약 다음과 같이 프로젝트 이름을 생성하면 base-package가
  `com.callor.flutter-000-hello-01` 처럼 생성이 되어 버린다
- 프로젝트 이름은 짧은 Key 값으로 생성하고 이후에 프로젝트 폴더 이름을 변경해 주는 것이 파일 관리가 유리하다
- 프로젝트 이름은 가급적 소문자로 작성한다.

```bash
flutter create --org=com.callor flutter-000-hello-01
```

## flutter 개발환경 설정 : 사용준비, 기존의 다른 도구들과 연결하기

- flutter야 내 컴퓨터에 여러 도구가 있는데 그것들과 연결되라

```bash
flutter doctor

```

- flutter doctor 를 실행한 후 Android toolchain 경고가 나오면 다음을 실행한다

```bash
flutter doctor --android-licenses
```

## flutter project 를 github 에서 clone 했을 때

- 프로젝트 코드, 파일에서 import 코드에 오류가 발생한다
- github 에 프로젝트를 push 하면 필요한 dependencies 도구들이
  생략되어 push된다
- clone 을 실행한 다음에는 dependencies 들을 다시 다운로드 해 주어야 한다

```bash
flutter pub get
```

파일에 숫자를 입력할거면 \_를 앞에 붙인다

변수 사용법
void main(List<String> args) {
int num1 = 10;
int num2 = 20;

<!-- 변수와 연산식을 사용하는 방법 -->

print("$num1, $num2");
print("${num1 + num2}");

<!-- 문자열을 사용하는 방법 -->

String nation1 = "대한민국";
String nation2 = "우리나라";
String korea = "$nation1 은 $nation2";
print(korea);

<!-- JAVA 10 부터는 var 키워드 사용 가능 (숫자, 문자열)-->

void main(List<String> args) {
var num1 = 20;
var num2 = 30;
var sum = num1 + num2;
print("$num1+$num2 =$sum");
  print("$num1-$num2 =${num1 - num2}");
print("$num1-$num2 =${num1 - num2}");
  print("$num1*$num2 =${num1 * num2}");
print("$num1/$num2 =${num1 / num2}");
  print("$num1 MOD $num2 =${num1 % num2}");
}

<!-- final 로 선언하면 변경이 불가능하다 -->

void main(List<String> args) {
// final로 선언된 변수는 변경이 불가능하다 . 만약 다른 값을 할당할려고 하면 오류가 발생한다

final int num1 = 20;
final int num2 = 30;
var s = "ds";
print(s);
}

<!-- 메서드 활용 return은 변수에 저장 후 변수를 return
final 뒤에 속성 타입이 없는데 메서드 에서 지정한 값에 따라 타입이 결정된다.
 -->
<!-- final과 const

  Dart 의 final 선언문과 const 선언문

  final
  final 선언문은 java, 일반적인 프로그래밍 언어의 final 적인 성질을 갖는
  변수 선언문이다. 한번 값을 할당(set) 하면 다시 값을 변경할 수 없다.

  const
  const 선언문은 겉보기는 final 과 유사하게 한 번 값을 할당 (set) 하면
  다시 값을 값을 변경 할 수 없다.
  또한 const 선언문은 함수의 return 값을 받을 수 없다.
  const 선언문은 코드가 실행괴기 전에 확정적인 값을 저장하는 용도이다.
  C/C++ 언어의 #define 명령문과 같은 성질이다.

  매직 리터럴 : "" 로 묶인 문자열, 직접 사용한 숫자값 등
  매직 리터럴은 실제 코드가 작동되는 과정에서 오류를 일으킬
  수 있는 정황을 가지고 있다. 그래서 이러한 매직 리터럴을 final 형식의
  변수에 저장하고 오류가 나는 것을 방지하는 방법이 사용된다

  Dart 에서는 매직 리터럴 값을 저장하는 변수에는 const 선언문을 부착한다

  const 선언문은 코드가 실행되기 전에 값이 확정적인 경우에 사용하는 키워드이다.

 const에 대해
 code가 실행되지 않아도 확실한 sumS
 const int sumS = 30 + 40;
 code가 실행되지 않으면 알 수 없는 sumC <= 이건 사용할 수 없다
  const int sumC = sumNums(30, 40);


 -->

void main(List<String> args) {
final numA = 30;
final numB = 400;
addNums(30, 50);
addNums(numA, numB);
final sum = sumNums(numA, numB);
print(sum);

const에 대해
code가 실행되지 않아도 확실한 sumS
const int sumS = 30 + 40;
code가 실행되지 않으면 알 수 없는 sumC <= 이건 사용할 수 없다

<!-- 메서드도 변수도 const 에는 저장할 수 없다 -->

const int sumC = sumNums(30, 40);
}

void addNums(int num1, int num2) {
print("${num1 + num2}");
}

int sumNums(int num1, int num2) {
return num1 + num2;
}

<!-- dart-000-hello 의hell_05.dart -->
<!-- multi line과 num 타입 그리고 bool 타입 -->

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

dart 는 특별한 경우가 아니면 숫자형 변수는 num 키워드를 권장한다
num num3 = 30;
bool bYes = true;

print("$num3, $bYes");
}

<!-- 정적할당과 동적할당 -->

void main(List<String> args) {
변수의 정적할당과 동적할당

정적할당
java 나 c/c++ 언어는 코드를 작성하는 단계에서
반드시 변수의 type을 지정해야 한다

동적할당
java 이후에 만들어진다양한 언어는 코드를 작성하는
단계에서 변수의 type 을 지정하지 않고, 변수에 값을 할당하는 순간
변수의 type 이 결정되는 방식을 많이 사용한다
dart 에서 동적할당 변수를 만들때:
var 키워드를 사용하여 변수를 선언할 때
반드시 값을 지정하여 변수를 초기화 시켜주어야 한다.
만약 초기에 값이 정해지지 않은 변수가 있다면, late 키워드를 사용하여
초기화를 미루는 선언을 해야 한다.
최근 버전에서는 late 를 일부 생략해도 오류가 나지 않는다

이건 동적할당
var num1;
var num2;
num1 = 30;
num2 = 40;
print("$num1, $num2");
}

<!-- 매개변수에 ? 를 넣으면 null값을  return 할 수 있다 -->

String stdFunc(String nation) {
return nation.toUpperCase();
}

String arrowFunc(String nation) => nation.toUpperCase();

int stdSum(int num1, int num2) {
int sum = num1 + num2;
return sum;
}

(String? name) = 매개변수는 null을 전달할 수 있다.
name?.toUpperCase() ?? null; name이 있다면 대문자로 바꾸고 없으면 null값을 return
다만 타입 을 설정할때 String? 이렇게 뒤에 ? 를 붙여야 한다.
String? arrowStrFunc(String? name) => name?.toUpperCase() ?? null;
String? stdNullFunc(String? name) {
if (name != null) {
return name.toUpperCase();
}
return null;
}

만약 없다면 NULL을 return할 수 없으니 not found라는 문자열 return
String arrowNotNullFunc(String? name) => name?.toUpperCase() ?? "NOT FOUND";

<!-- 배열(list) 출력하는 방법 -->

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

<!-- shuffle 로 랜덤한 숫자 6자리 뽑기 -->

void main(List<String> args) {
for (int i = 0; i < 10; i++) {
print(i);
}

int sum = 0;
for (int i = 0; i < 10; i++) {
sum += (i + 1);
}
print("합계:$sum");

sum = 0;
for (var i = 0; i < 10; i++) {
int num = i + 1;
if (num % 2 == 0) sum += num;
}
print("1~10까지 짝수의 합 : $sum");

String srt = "dd";
print("$srt" + "$sum");

List<int> nums = [];
for (int i = 0; i < 45; i++) {
nums.add(i + 1);
}
nums.shuffle();
String out = "";
for (int i = 0; i < 6; i++) {
out += "${nums[i]}\t";
}
print(out);
}
