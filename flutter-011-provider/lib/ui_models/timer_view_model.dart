import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mview/models/timer_dto.dart';

///provider를 활용한 ViewModel 패턴을 적용하기 위하여
/// ViewModel 클래스를 선언한다
/// ChangeNotifire 라는 클래스를 상속받아서 작성한다
// ChangeNotifier는 material에 기본적으로 내장된 클래스

/// state 변수는 State<> 클래스에서 선언하고
/// 값을 변화시키려면 setState() 함수를 통하여 실행했다.
/// 하지만 여기서는 MVVM 패턴을 활용해 state의 값을 변화시키는 코드를
/// ChangeNotifier를 상속받은 ViewModel 클래서에서 실행한다
class TimerViewModel extends ChangeNotifier {
  // timerDto를 state로 쓸거다
  // viewModel의 state변수
  var timerDto = TimerDto();

// async 패키지에 포함된 객체
// 변수이름에 _가 부착되면 이 변수는 private 성질을 띈다
  late Timer _timer;

  void setTimer(timer) {
    timerDto.timer = timer;
    notifyListeners();
  }

// timerDto state 변수의 값을 변화시키는 함수
  void onPressed() {
    // true와 false를 반전시킨다
    timerDto.timerRun = !timerDto.timerRun;
// true면
    if (timerDto.timerRun) {
      // Timer.periodic (시간값, 함수())
      // 시간값이 경과할때마다 함수()를 실행한다

      _timer = Timer.periodic(
        const Duration(seconds: 1), // 1초마다 타이머값을 감소시킨다
        (timer) {
          timerDto.timer--;
          if (timerDto.timer < 1) {
            timerDto.timer = 300;
            timerDto.timerRun = false;
            timer.cancel();
          }
// class를 state로 쓰게 해주는 것
// viewModel에서 state 변수값을 변화 시켰으니
// 화면에 그려라 라는 통보
// State<> 클래스에서 setState를 실행하는 것과 유사하다 같진 않고
          notifyListeners();
          // state는 안보고 있는 화면도 렌더링 시키는데 notifyListeners를 쓰면 내가 보고 있는 화면만
          // 랜더링시킬수 있다. 다른 화면은 보류하고
          // 랜더링 할 화면을 notifyListeners로 선택 가능
        },
      );
    } else {
      _timer.cancel();
    }
  }
}
