// 导入包
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  // widget的主要工作就是提供一个build方法你描述ui页面
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '标题',
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHomePage(title: '哈哈哈哈'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

// 将build方法放在State中，可以给开发带来很大的灵活性 目前不好理解
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _changeCounter() {
    setState(() {
      _counter++;
    });
  }

  // 构建ui
  Widget build(BuildContext context) {
    // 跳转到新页面
    void gotoPage() {
      // 添加一个路由栈
      // Navigator是路由管理组件,他提供了打开和退出路由的方法
      // push为进入 pop为返回
      Navigator.push(
          // MaterialPageRoute继承自PageRoute,表示占用整个屏幕空间的模态路由页面
          // 可以定义路由构建以及切换是过渡动画的相关属性
          //  MaterialPageRoute({
          //   WidgetBuilder builder, // 他的作用是构建路由页面的具体内容没返回一个widget
          //   RouteSettings settings, // 路由配置信息 路由名称 是否初始路由
          //   bool maintainState = true, // 将此参数设置为false,将会销毁上一个页面
          //   bool fullscreenDialog = false, // 为true页面将从底部划出,false为侧边
          // })
          context,
          MaterialPageRoute(
              builder: (context) => NewRoute(), fullscreenDialog: true));
      // 实例方法写法
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewRoute(), fullscreenDialog: true));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // 垂直排列的布局方式
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('点击到新页面'),
              textColor: Colors.blue,
              onPressed: gotoPage,
            ),
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

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新的页面')),
      body: Center(
        child: Text('这是一个新页面'),
      ),
    );
  }
}
