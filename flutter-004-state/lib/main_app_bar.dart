import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) => AppBar(
      title: const Text(
        "아아.. 이것은 bar라는 것이다..",
      ),
      centerTitle: true,
      elevation: 5.0,
      actions: [
        IconButton(
          onPressed: () {
            var snackBar = SnackBar(
              content: const Text("아아..이것은 bar의 text 라는 것이다.."),
              action: SnackBarAction(
                  label: "아아.. 이것은 확인이라는 것이다..", onPressed: () {}),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.person),
        )
      ],
    );
