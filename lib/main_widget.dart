import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '标题',
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text('widget-标题'),
          ),
          // body: Echo(text: "hello world"),
          // body: ContextRoute(),
          body: CounterWidget(),
          // body:CupertinoTestRoute(),
        ));
  }
}

// StatelessWidget 静态类
class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey,
        child: Text(text, textDirection: TextDirection.ltr),
      ),
    );
  }
}

// 获取父级的标题
class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context是BuildContext实例,表示当前节点的上下文,可以通过他获取父级的一些配置
    return Container(
      child: Builder(
        builder: (context) {
          Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          return (scaffold.appBar as AppBar).title;
        },
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key, this.initValue: 0});
  final int initValue;
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print('initState');
  }

  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(title: Text('2222'),),
      body: Center(
        // child: FlatButton(
        //     onPressed: () => setState(() => ++_counter),
        //     child: Text('$_counter')),
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              // 第一个就是通过context获取到上层的state
              // 第二就是用过组件静态方法of获取到state
              // ScaffoldState _state =
              //     context.findRootAncestorStateOfType<ScaffoldState>();
              ScaffoldState _state = Scaffold.of(context);
              // _state.showSnackBar(
              //   SnackBar(content: Text('我是SnackBar')),
              // );
              // 通过全局方法GlobalKey获取当前weiget state(开销较大,不推荐)
              _globalKey.currentState.showSnackBar(
                SnackBar(content: Text('我是SnackBar')),
              );
            },
            child: Text('显示SnackBar'),
          );
        }),
      ),
    );
  }

  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  void dispose() {
    super.dispose();
    print('dispose');
  }

  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}


class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("Press"),
            onPressed: () {}
        ),
      ),
    );
  }
}