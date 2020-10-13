import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '图片demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('图片显示'),
          ),
          body: Center(
            child: Text('222'),
          ),
        ));
  }
}
