import 'package:flutter/material.dart';
import 'package:mview/ui_models/page_view_model.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 콘트롤러
    var textController = TextEditingController();
    var setTimer = context
        .select<TimerViewModel, Function(int)>((value) => value.setTimer);
    var pageViewModel = context.watch<PageViewModel>();

    // var setTimer =
    //     context.select<TimerViewModel, Function()>((value) => value.setTimer);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(hintText: "타이머입력"),
            ),
            ElevatedButton(
              onPressed: () {
                setTimer(int.parse(textController.text));
                // 키보드로 되돌아가기
                pageViewModel.bottomNavTap(0);
                // 키보드감추기
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: const Text("저장"),
            )
          ],
        ),
      ),
    );
  }
}
