<!-- pop -->

stack과 비슷하다

제일 밑에 쌓아놓고 pop 으로 덮고 뺴는 걸 할 수 있다.
다만 데이터를 뺀다 하더라도 덮혀있는 데이터는 남아있기 때문에 연결이 계속된다.

push로 화면을 쌓고 pop으로 가장 위의 화면부터 제거한다

건물로 따지면 1 2 3 4 5 층 이렇게 push 로 쌓는거고 pop을 사용하면 5층부터 제거된다
그럼 한 번 제거될 떄마다 4 3 2 1 층이 나오겠지

````dart
push 예시   : var result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(
                                updateAuthUser: widget.updateAuthUser,
                              ),
                            ),
                          );

push예시
pop 예시 : Navigator.pop(context);

```
````
