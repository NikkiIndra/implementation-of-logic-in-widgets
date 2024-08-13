// import 'dart:io';

void main() async {
  // String name = stdin.readLineSync() ?? 'default name';
  var getPerson = Person();

  print("data 1");
  print("data 2");
  // getPerson.getDataAsyng2();
  // print('data 3' + getPerson.name);
  // print('tanpa await');

  // await getPerson.getDataAsyng3();
  // print('data 4' + getPerson.name);
  // print('menggunakan await');

  getPerson.getDataAsyng().then((_) {
    print("data 5 berisi : " + getPerson.name);
  });
  // getPerson.getData();
  // print("data 5 " + getPerson.name);

  print("data terakhir.....");
  print("data 6");
}

class Person {
  String name = 'default name';

  //Person(this.name);

  void getData() {
    name = 'joko';
    print("get data [done]");
  }

  Future<void> getDataAsyng() async {
    await Future.delayed(Duration(seconds: 3));
    name = ' nikki ';
    print("get data 1 [done]");
  }

  Future<void> getDataAsyng2() async {
    await Future.delayed(Duration(seconds: 3));
    name = 'nikki';
    print("get data 2 [done]");
  }

  Future<void> getDataAsyng3() async {
    await Future.delayed(Duration(seconds: 3));
    name = ' nikki';
    print("get data 3 [done]");
  }
}
