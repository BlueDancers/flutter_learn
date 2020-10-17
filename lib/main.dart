import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('文本组件'),
        ),
        body: Column(
          children: [
            Text(
              '你好世界',
              textAlign: TextAlign.left,
            ),
            Text(
              '你好世界,我是vkcyan' * 4,
              maxLines: 1, // 最多几行
              overflow: TextOverflow.ellipsis, // 超出后如何显示
            ),
            Text(
              '你好世界',
              textScaleFactor: 1.5,
            ), // textScaleFactor表示缩放比例
            Text(
              '你好世界',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2, //该属性用于指定行高,但是他不是一个绝对值,具体的高度是height*fontSize
                  fontFamily: 'Courier',
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text.rich(TextSpan(children: [
              // Text.rich可以显示widget组件
              TextSpan(text: 'home:'),
              TextSpan(
                text: '名邦西城国际',
                style: TextStyle(color: Colors.blue),
                // recognizer: _tapRecognizer
              ),
            ])),
            // 如果很多的text的样式都是一样的,那就使用defaulttextstyle组件,里面的text组件,只要未指定inherit为false,就会继承样式
            DefaultTextStyle(
                style: TextStyle(color: Colors.red, fontSize: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('hello word'),
                    Text('I am jack'),
                    Text(
                      'i am jack',
                      style: TextStyle(inherit: false, color: Colors.grey),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
