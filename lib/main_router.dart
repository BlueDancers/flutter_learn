// 导入包
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  // widget的主要工作就是提供一个build方法你描述ui页面
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '标题',
      initialRoute: '/', // 默认路由
      routes: {
        // 'new_page': (context) => NewRoute(),
        // 'router_test_route': (context) => RouterTestRoute(),
        // 'tip_router': (context, {arguments}) {
        //   // 如果页面存在参数接收的情况下,则需要这么写
        //   return TipRouter(text: ModalRoute.of(context).settings.arguments);
        // },
        '/': (context) => MyHomePage(title: '1111'),
      },
      onGenerateRoute: (RouteSettings settings) {
        // 如果使用了了onGenerateRoute,我们甚至不需要再使用路由表了,因为路由表里面不存在的路由就会走到这个函数中
        // 我们可以在这个函数中进行判断是否给予通过,只需要创建一个路由映射表即可
        // 例如未登录情况下,只允许访问基本的路由
        print(settings);
        return MaterialPageRoute(builder: (context) => NewRoute());
      },
      navigatorObservers: [],
      theme: ThemeData(primaryColor: Colors.blue),
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
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => NewRoute(), fullscreenDialog: true));
    }

    void gotoPageTwo() {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => RouterTestRoute()));
      Navigator.pushNamed(context, 'router_test_route');
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
              child: Text('点击到路有传值'),
              textColor: Colors.blue,
              onPressed: gotoPageTwo,
            ),
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

// 跳转页面测试代码
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

class TipRouter extends StatelessWidget {
  TipRouter({@required this.text});
  final String text;
  // 获取上级页面传入的值
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('提示')),
      // Padding widget似乎是用来定义padding的
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(text),
              RaisedButton(
                // 在子页面有2个方法可以返回到上个页面,第一个就是pop,第二个就是导航栏自带的导航
                // 区别是pop的可以携带数据到上一层,而导航栏自带的返回键无法携带数据
                onPressed: () => Navigator.pop(context, '返回去一个寂寞'),
                child: Text('返回'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Center(
          child: Column(
        children: [
          RaisedButton(
              onPressed: () async {
                // var result = await Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //   return TipRouter(text: '测试文字');
                // }));
                // 命名路由的跳转传值方式
                var result = await Navigator.pushNamed(context, 'tip_router',
                    arguments: '想不到吧');
                print('路由返回值,$result');
              },
              child: Text('打开提示页面')),
          RaisedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text('返回上一页'))
        ],
      )),
    );
  }
}
