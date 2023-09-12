import 'package:flutter/material.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String _formatTime(seconds) {
    var duration = Duration(seconds: seconds);
    // return duration.toString().split(".").first.substring(2);
    return duration.toString();
  }

  @override
  Widget build(BuildContext context) {
    // context.select : 이게 구독여부이다.
    context.select((value) => null);
    // context.watch();
    // context.read();

    var strTimer = context.select<TimerViewModel, String>(
      (value) => _formatTime(value.timerDto.timer),
    );

    var timerRun = context.select<TimerViewModel, bool>(
      (value) => value.timerDto.timerRun,
    );
// context.select : view모델이 있는 클래스들
    var onPressed = context.select<TimerViewModel, Function()>(
      (value) => value.onPressed,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            Text(
              // statelesswidget에 설정했다는게 중요함 화면을 변화시킬려면 stateful에 해야하지만
              // MVVP모델은 아니다
              strTimer,
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Colors.red),
            ),
            Text(
              strTimer,
              style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Colors.white38,
          isExtended: true,
          child: Icon(
            timerRun ? Icons.pause : Icons.play_arrow_rounded,
            size: 60,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
