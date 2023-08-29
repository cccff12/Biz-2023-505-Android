import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const Center(
      child: NewWidget(),
    ),
  );
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "반갑습니다.",
      style: TextStyle(
        fontSize: 50,
        color: Color.fromRGBO(255, 0, 255, 1),
      ),
      textDirection: TextDirection.ltr,
    );
  }
}