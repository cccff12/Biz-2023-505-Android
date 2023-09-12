/// Dto 클래스 생성하기
/// 1. 추상화가 된 요소를 갖는 클래스를 선언한다.
/// 2. 추상화된 요소의 초기값을 설정하기 위한 생성자를 선언

class TimerDto {
  int timer;
  bool timerRun;

  TimerDto({this.timer = 300, this.timerRun = false});
}
