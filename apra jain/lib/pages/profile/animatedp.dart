import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class DpAnimate extends StatefulWidget {
  DpAnimate({Key key}) : super(key: key);

  @override
  _DpAnimateState createState() => _DpAnimateState();
}

/// This is the private State class that goes with DpAnimate.
class _DpAnimateState extends State<DpAnimate>
    with SingleTickerProviderStateMixin {
  double _size = 60.0;

  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 150.0 : 60.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(),
      padding: EdgeInsets.all(3),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        shape: BoxShape.circle,
      ),

      child: Center(
        child: GestureDetector(
          onTap: () => _updateSize(),
          child: AnimatedSize(
            curve: Curves.easeIn,
            vsync: this,
            duration: Duration(milliseconds: 100),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/ethnic.jpg'),
              radius: _size,
            ),
          ),
        ),
      ),
    );
  }
}
