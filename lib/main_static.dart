import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    Future<String> loadAsset() async {
      return await rootBundle.loadString('assets/static/1.json');
    }

    loadAsset().then((value) => print(value));
    // return DecoratedBox(
    //     decoration: BoxDecoration(
    //         image: DecorationImage(image: AssetImage('assets/images/2.png'))));
    return Image.asset('assets/images/1.jpg');
    // return MaterialApp(
    //     title: '图片demo',
    //     home: Scaffold(
    //       appBar: AppBar(
    //         title: Text('图片显示'),
    //       ),
    //       body: Center(
    //         child: Text('222'),
    //       ),
    //     ));
  }
}
