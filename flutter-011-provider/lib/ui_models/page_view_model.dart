import 'package:flutter/material.dart';

class PageViewModel extends ChangeNotifier {
  // dto 클래스처럼 private 속성을 선언하고, getter method를 선언

  // 2개의 state(_pageController, _pageIndex)를 만들고 그걸 외부에서 쓸 수 있게 2개의 get를 만듬

  final _pageController = PageController(initialPage: 0);
  get pageController => _pageController;

  int _pageIndex = 0;
  get pageIndex => _pageIndex;

// pageindex값 변화
  void pageViewChange(newPageIndex) {
    _pageIndex = newPageIndex;
    notifyListeners();
  }

  void bottomNavTap(pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }
}
