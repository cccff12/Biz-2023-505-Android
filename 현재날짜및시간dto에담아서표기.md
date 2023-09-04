<!-- Todo라는 Dto에서 -->

```dart
Todo getTodo(String content) {
   return Todo(
    <!-- 여기 밑에 2개의 형식 잘 지키기 -->
     sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
     stime: DateFormat("HH:ss:mm").format(DateTime.now()),
     content: content,
     complete: false,
   );
 }
```
