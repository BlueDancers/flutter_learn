import 'package:flutter/material.dart';

void main() {
  return runApp(ParentWidgetC());
}

// class TapboxA extends StatefulWidget {
//   TapboxA({Key key}) : super(key: key);
//   _TapboxState createState() => new _TapboxState();
// }

// class _TapboxState extends State<TapboxA> {
//   bool _active = false;
//   void _handleTap() {
//     setState(() {
//       _active = !_active;
//     });
//   }

//   Widget build(BuildContext context) {
//     return new GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         child: Center(
//           child: Text(
//             _active ? 'Active' : 'Inactive',
//             textDirection: TextDirection.ltr,
//             style: TextStyle(fontSize: 48.0, color: Colors.white),
//           ),
//         ),
//         decoration: BoxDecoration(
//             color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
//       ),
//     );
//   }
// }

// class ParentWidget extends StatefulWidget {
//   _ParentWidgetState createState() => new _ParentWidgetState();
// }

// class _ParentWidgetState extends State<ParentWidget> {
//   bool _active = false;
//   void _handleTapboxChanged(bool newValue) {
//     setState(() {
//       _active = newValue;
//     });
//   }

//   Widget build(BuildContext context) {
//     return Container(
//       child: TapboxB(active: _active, onChanged: _handleTapboxChanged),
//     );
//   }
// }

// class TapboxB extends StatelessWidget {
//   TapboxB({Key key, this.active: false, @required this.onChanged})
//       : super(key: key);
//   final bool active;
//   final ValueChanged<bool> onChanged;
//   void _handTap() {
//     onChanged(!active);
//   }

//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handTap,
//       child: Container(
//         child: Center(
//           child: Text(
//             active ? 'active' : 'inactive',
//             textDirection: TextDirection.ltr,
//             style: TextStyle(
//               fontSize: 32.0,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         decoration: BoxDecoration(
//           color: active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//       ),
//     );
//   }
// }

class ParentWidgetC extends StatefulWidget {
  _ParentWidgetC createState() => new _ParentWidgetC();
}

class _ParentWidgetC extends State<ParentWidgetC> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Tapboxc(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class Tapboxc extends StatefulWidget {
  Tapboxc({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<Tapboxc> {
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'active' : 'inactive',
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? Border.all(color: Colors.teal[700], width: 10)
                : null),
      ),
    );
  }
}
