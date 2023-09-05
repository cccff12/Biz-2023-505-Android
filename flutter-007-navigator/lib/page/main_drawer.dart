import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/email_page.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/my_page.dart';

Widget maindrawer(BuildContext context) => Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(
                  "UserAccountsDrawerHeader_currentAccountPicture_CircleAvatar_child"),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              )
            ],
            accountName: Text("UserAccountsDrawerHeader_accountName"),
            accountEmail: Text("UserAccountsDrawerHeader_accountEmail"),
          ),
          ListTile(
            title: const Text(
              "Drawer_ListView_ListTile_child_home",
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.amber,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Drawer_ListView_ListTile_child_mypage",
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
            leading: const Icon(
              Icons.merge_type,
              color: Colors.amber,
            ),
            onTap: () => Navigator.of(context).pushNamed("/mypage"),
          ),
          const Divider(
            height: 0.2,
          ),
          ListTile(
            title: const Text(
              "Drawer_ListView_ListTile_child_email",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 211, 80), fontSize: 20),
            ),
            leading: const Icon(
              Icons.email,
              color: Colors.amber,
            ),
            onTap: () {
              debugPrint("home메뉴 클릭됨");

              /// 스마트 기기에서 현재 화면을 다른 화면으로 전환하기
              /// web , pc에서는 어플리케이션에서는 다순히 화면을 전환하는데 어려움이 없다
              /// 하지만 스마트 기기에서는 화면 하나하나가 context이다
              /// 화면을 전환 시킬때도 context를 잘 관리 해야한다

              // const HomePage();
              Navigator.of(context).pushNamed("/mypage",
                  arguments: {"email": "callor@sadasdsad.com"});
            },
          ),
          const Divider(
            height: 0.2,
          ),
        ],
      ),
    );
