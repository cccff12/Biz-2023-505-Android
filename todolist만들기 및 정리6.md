# Todo list 프로젝트

- 날짜 시간 등을 처리할 Dependency 를 add 하기
- `intl` 은 날짜 시간 `locale` , 화폐단위 등을 처리할 때 함수를 지원하는 도구

```bash
flutter pub get intl
```

<!-- Row:  Row는 가로로 배치되는 위젯들의 그룹을 나타내는 것입니다.
Row 위젯을 사용하면 자식 위젯들을 가로 방향으로 나란히 배치할 수 있습니다. -->

<!-- 삭제는 2가지가 있는데

Remove와
RemoveAt이 있다
 -->

<!-- 아이콘 버튼 만들기 (기능 없음) -->

```bash
actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_alert_outlined))
        ],
```

<!-- 알럿창 만들기 -->

```bash
var alertDialog = const AlertDialog(
    actions: [
      TextField(
        decoration: InputDecoration(hintText: "hintext가 들어가는 곳"),
      ),
    ],
  );
# 이렇게 원하는 기능 만들어주고


return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "images/profile.jpg",
          fit: BoxFit.fill,
        ),
        title: const Text("나의 todo 리스트 app바에 들어가는 거"),


# 방금 위에(아이콘만들기) 부분이 여기인데 onPress 추가됨
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => alertDialog,
                );
              },
              icon: const Icon(Icons.add_alert_outlined))
        ],
# 여기까지 위에 알럿창만들기 코드였음

      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(todoList[index].content));
        },
      ),
    );

# 방금 바로 전에 있던
```

<!-- 알럿 var를 함수로 바꿀수도 있음 -->

```bash
Widget alertDialog(BuildContext context) => const AlertDialog(
        actions: [
          TextField(
            decoration: InputDecoration(hintText: "hintext가 들어가는 곳"),
          ),
        ],
      );

```

<!-- 화면 몸체에 넣는 것 : scafford 밑에는 현재
appBar(icon이랑 글자 들어감. Icon에는 알럿), 그리고 ListView가 있음 밑에는 ListView -->

<!-- 
비유하자면
state 안은 현재 이렇게 구성됨
-----------
            |
------------|    
appBar      | (글자, 아이콘, 아이콘의 alert)
------------|
body        |(dto의 날짜, 시간, 내용을 넣음)
            |
            |
-----       |
 --> ------ |

```bash
body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Column(
                  // 왼쪽에 Column 붙이기
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 내용 추가
                  children: [ # column의 body인 children
                    Text(todoList[index].sdate),
                    Text(todoList[index].stime),
                  ],
                ),
                # 기존에 이걸로 content Dto만 표기했는데 이걸 Colunm으로 감싸고 밖으로 뺌
                # 그리고 Text()를 2개 추가함
                Text(todoList[index].content),
              ],
            ),
          );
      ),
```

```bash

```
