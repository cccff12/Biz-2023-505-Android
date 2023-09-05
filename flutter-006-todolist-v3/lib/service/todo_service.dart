import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/models/todo.dart';

// ignore: constant_identifier_names
const String TBL_TODO = "tbl_todoList";

/// 안드로이드, iphone  에는 공통으로 SQLite라는 RDBMS가 내장되어 있다
/// 규모는 매우 작지만 phone에서 DB를 SQL을 사용해 관리할 수 있도록
/// 여러가지 명령어를 제공한다
/// 기본적인 기능만으로는 사용이 불편해 sqflite.dart를 사용해 관리한다
class TodoService {
  // 변수 이름에 under score 를 붙이면 이 변수는 private라는 의미
  // late 키워드는 아직 변수를 초기화 시키진 않았지만 null이 아니라는 선언
  late Database _database; // 누군가 값을 부여 할 것이다
  final String createTABLE = """
      CREATE TABLE $TBL_TODO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      sdate TEXT,
      stime TEXT,
      content TEXT,
      complete INTEGER
    )
    """;

  /// Future
  /// 함수의 return type으로 사용하는 키워드
  /// 이 함수는 언젠가 실행될거고 return값이 nullㅣ 아니라는 선언
  /// JS의 Promise키워드와 같은 역할을 한다
  /// 비동기 방식 함수에 주로 사용한다

// db를 매개변수로 받아 업그래에드 하는 함수
  Future<void> onCreateTable(db, version) async {
    return db.execute(createTABLE);
  }

// 새로운 버전이 더 크면 새롭게 테이블을 만들어야 함
// async 키워드는 함수나 메서드의 앞에 붙여서
//해당 함수가 비동기적으로 실행됨을 나타낸다
  Future<void> onUpgreadeTable(db, oldVersion, newVersion) async {
    if (newVersion > oldVersion) {
      // await 키워드는 비동기 함수 내에서
      //다른 비동기 함수나 작업이 완료될 때까지 대기하도록 지시
      final db = await database;
      // batch: 일괄처리를 위해 사용
      final batch = db.batch();
      // 드롭명령어 전달 후 자동으로 TBL_TODO실행
      batch.execute("DROP TABLE $TBL_TODO");
      batch.execute(createTABLE);
      // batch.commit()로 배치에 추가한 작업을 실행한다
      await batch.commit();
    }
  }

  Future<Database> initDatabase() async {
    // 실제 폰의 DB가 저장되는 경로를(path) 가져오기
    String dbPath = await getDatabasesPath();
// 실제 저장될 database 파일을 설정, 오라클의 tablespace와 비슷함
    var dbFile = join(dbPath, "todo.dbf");
    // 시작할때 데이터가 없으면 이거 실행
    return await openDatabase(
      dbFile,
      onCreate: onCreateTable,
      onUpgrade: onUpgreadeTable,
      // 처음에는 1이었으
      version: 3,
    );
  }

// _database private 변수를 외부에서 사용하기 위한 getter method
  Future<Database> get database async {
    _database = await initDatabase();
    return _database;
  }

  Future<int> insert(Todo todo) async {
    final db = await database;
    // map은 키와 값을 쌍으로 데이터를 저장하는 자료구조로 db에서는
    // db라이브러리가 db를 맵형태로 삽입하거나 업데이트 하기를 선호한다
    return await db.insert(TBL_TODO, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

// SQL 을 사용할 때 문자열 연결방식으로 WHERE 절을 사용하면 안된다
// SQL Injection 공격에 노출될 수 있다.
// 만약 이처럼 코드를 작성 했을 떄 where : "id = ${id}",
// id 변수에 "1 = 1 OR" 와 같은 코드를 전달하면 Table 의 모든 데이터가 삭제된다
  Future<int> delete(int id) async {
    final db = await database;
    return db.delete(
      TBL_TODO,
      where: "id = ?", // =>"id = ${id}" 이것도 가능하지만 공격당할수 있음
      whereArgs: [id],
    );
  }

  Future<int> update(Todo todo) async {
    final db = await database;
    return db.update(
      TBL_TODO,
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

// 비동기 방식으로 select 하여 데이터를 return 하고 있다.
  Future<List<Todo>> selectAll() async {
    final db = await database;
    final List<Map<String, dynamic>> todolist = await db.query(TBL_TODO);
// select 한 데이터를(resultSet) 리스트 타입의 List<Todo> 로 변환하기
    return List.generate(
        todolist.length,
        (index) => Todo(
              id: todolist[index]["id"],
              sdate: todolist[index]["sdate"],
              stime: todolist[index]["stime"],
              content: todolist[index]["content"],
              complete: todolist[index]["complete"] == 1 ? true : false,
            ));
  }
}
