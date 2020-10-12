import 'package:flutter/material.dart';

// void main() {
//   // ignore: unused_element
//   runApp() {
//     Center(
//       child: Text(
//         '你好世界',
//         textDirection: TextDirection.ltr,
//         // textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {
  // 生命周期器函数
  MyApp() {
    // aaa();
    // bbb();
    ccc();
  }
  void aaa() {
    // future dart的异步解方案
    Future.delayed(new Duration(seconds: 2), () {
      // return 'hello';
      throw AssertionError('Error');
    })
        .then((value) => print(value))
        .catchError((err) => {print(err)})
        .whenComplete(() => print('执行完成'));
  }

  bbb() {
    Future.wait([
      Future.delayed(new Duration(seconds: 1), () {
        return 'hello';
      }),
      Future.delayed(new Duration(seconds: 2), () {
        return 'flutter';
      })
    ]).then((value) => print(value));
  }

  void ccc() {
    Stream.fromFutures([
      Future.delayed(new Duration(seconds: 1), () {
        return 'hello';
      }),
      Future.delayed(new Duration(seconds: 2), () {
        throw AssertionError('Error');
      }),
      Future.delayed(new Duration(seconds: 3), () {
        return 'word';
      })
    ]).listen((event) {
      print(event);
    }, onError: (err) => {print(err)}, onDone: () => {print('函数流执行完成')});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: '你好,flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('你好,flutter'),
        ),
        body: Center(
          child: Text('你好fluttera1'),
        ),
      ),
    );
  }
}
