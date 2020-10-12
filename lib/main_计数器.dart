// 导入包
import 'package:flutter/material.dart';

/// 程序入口,runApp用于启动flutter应用,runApp方法接受一个Widget参数
void main() => runApp(App());

// 应用继承于StatelessWidget,程序本身就是同一个widget(无状态组件)
class App extends StatelessWidget {
  // 注解表示重写父类方法
  @override
  // widget的主要工作就是提供一个build方法你描述ui页面
  Widget build(BuildContext context) {
    // MaterialApp是materiaapp库提供的一个flutter App框架,通过他可以设置应用的名称,语言,首页,以及路由表
    // 他本身也是一个widget
    return MaterialApp(
      title: '标题',
      theme: ThemeData(primaryColor: Colors.blue),
      // home为应用的首页
      home: MyHomePage(title: '哈哈哈哈'),
    );
  }
}

// MyHomePage是指定的首页,,他继承与ful类,表示他是提个有状态的组件
// statefluWidget可以拥有状态,,这些状态在生命周期内是可以改变的
class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  MyHomePage({this.title});
  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

// 将build方法放在State中，可以给开发带来很大的灵活性 目前不好理解
class _MyHomePageState extends State<MyHomePage> {
  // 点击次数
  int _counter = 0;
  // 定义方法进行点击次数的改变
  void _changeCounter() {
    // setState通知flutter框架,有状态发生变化,flutter会重新执行Build方法,来根据新的状态重新构建页面
    setState(() {
      _counter++;
    });
  }

  // 构建ui
  Widget build(BuildContext context) {
    // scaffold(骨架) 是material库提供的页面脚手架,他提供了默认的状态栏,标题,包含主屏幕的widget树
    // 路由通常都是scaffold进行创建的
    return Scaffold(
      // 头部
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Center组件 可以将其组件数对齐屏幕中心
      // Column组件 将其所有子组件样屏幕垂直方向依次排列
      body: Center(
        child: Column(
          // 垂直排列的布局方式
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点击按钮增加次数'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      // 页面右下角的悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _changeCounter, // 点击触发事件
        tooltip: '点击增加', // 长按提示文字
        child: Icon(Icons.add), // 加好
      ),
    );
  }
}
