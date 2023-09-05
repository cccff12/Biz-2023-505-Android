import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key, required this.userDto});
  final User userDto;

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  var userNameInputController = TextEditingController();
  var passwordInputController = TextEditingController();
  var nicknameInpitController = TextEditingController();

  var username = "";
  var password = "";
  var nickname = "";
  var email = "";

  bool passwordVisible = true;

// State 클래스가 생성될 때 호출되는 함수
// State 변수나, State 클래스에서 사용하는 여러가지 변수들을 초기화
// 할 때 코드를 작성할 수 있는 부분
  @override
  void initState() {
    username = widget.userDto.username;
    password = widget.userDto.password;
    nickname = widget.userDto.nickname;
    email = widget.userDto.email;
    userNameInputController.text = username;
    passwordInputController.text = password;
    nicknameInpitController.text = nickname;
    super.initState();
  }

// controller들은 페이지가 넘어가도 남아있어 메모리가 반드시 낭비된다.
//그러니 dispose 데이터를 삭제해야 함
  @override
  void dispose() {
    userNameInputController.dispose();
    passwordInputController.dispose();
    nicknameInpitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("appbar의 titleLarge, 회원정보 수정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userNameInputController,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: InputDecoration(
                  // input 박스 뒤에 보이는 아이콘
                  // dto말고 변수 값이 3이상이면 아이콘 표시
                  suffixIcon: username.length > 1
                      // iconbutton 으로 아이디를 이용해 클리어 해버리기
                      ? IconButton(
                          onPressed: () {
                            userNameInputController.clear();
                            setState(() {
                              username = "";
                            });
                          },
                          icon: const Icon(Icons.clear))
                      : const SizedBox(),
                  hintText: "username",
                ),
              ),
              TextField(
                // my_page에서 전달한 값을 위의 stateful에서 initState의
                // passwordInputController.text = password; 로 받아서 여기에 전달
                controller: passwordInputController,
                obscureText: true,
                // 적은 글자가 @로 보이게 하는것. 실제 값은 입력됨
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: passwordVisible
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  hintText: "password",
                ),
              ),
              TextField(
                controller: nicknameInpitController,
                decoration: const InputDecoration(
                  hintText: "nickname",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // dto에 버튼으로 내용을 담고 pop으로 보낸다
                    var userDto = User(
                        username: userNameInputController.text,
                        password: passwordInputController.text,
                        nickname: nicknameInpitController.text,
                        email: "email",
                        tel: "tel");
                    // 이게 일반적
                    // Navigator.of(context).pop(userDto);
                    // 이건 안 일반적
                    Navigator.pop(context, userDto);
                  },
                  child: const Text("수정"))
            ],
          ),
        ),
      ),
    );
  }
}
