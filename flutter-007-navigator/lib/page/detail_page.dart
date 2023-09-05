import 'package:flutter/material.dart';
import '../models/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.userDto,
  });

  final String name;
  final String email;
  final User userDto;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("detail"),
      ),
      body: Center(
        child: Column(
          // 가운데로 옮기기
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Scaffold_body_Center_child_Text_detail"),
            // stateful의 데이터를 state가 자동으로 받진 못한다. 따로 전달해 줘야 하는데
            // 이걸 전달하기 위해서는
            // 또 이걸 받기 위해서는 ${widget.변수이름} 이렇게 써야한다.
            Text("stateful 의 const DetailPage 에서 설정한 매개변수 ${widget.name} "),
            Text("stateful 의 const DetailPage 에서 설정한 매개변수 ${widget.email} "),
            Text(
                "stateful 의 const DetailPage 에서 설정한 매개변수 ${widget.userDto.email} "),
            Text(
                "stateful 의 const DetailPage 에서 설정한 매개변수 ${widget.userDto.nickname} "),
            Text(
                "stateful 의 const DetailPage 에서 설정한 매개변수 ${widget.userDto.password} "),
            Text(
                "stateful 의 const DetailPage 에서 설정한 매개변수 ${widget.userDto.tel} "),
            Text(
                "stateful 의 const DetailPage 에서 설정한 매개변수 ${widget.userDto.username} "),
          ],
        ),
      ),
    );
  }
}
