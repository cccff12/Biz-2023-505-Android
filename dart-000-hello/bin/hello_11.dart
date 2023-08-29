void main(List<String> args) {
  var names = ["홍", "이", "성"];

  for (var i = 0; i < names.length; i++) {
    print(names[i]);
  }

  for (var name in names) {
    print(name);
  }

  names.forEach((name) {
    print(name);
  });

  var result = names.map((name) {
    return "이름 : $name";
  });
  print(result);
  result = names.map((name) => "이름 : $name");
  print(result);
}
