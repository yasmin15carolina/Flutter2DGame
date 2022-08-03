import 'package:flutter/material.dart';

class ScreenObject extends StatefulWidget {
  final List<String> pathsObj;
  final List<String> pathsGround;
  final double x;
  final double y;
  final double scale;

  const ScreenObject(
      {Key key,
      this.pathsObj: const [],
      this.pathsGround: const [],
      this.x,
      this.y,
      this.scale: 1})
      : super(key: key);

  @override
  _ScreenObjectState createState() => _ScreenObjectState();
}

class _ScreenObjectState extends State<ScreenObject> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 1),
        alignment: Alignment(widget.x, widget.y),
        child: Stack(children: [
          Text("X:${widget.x}, Y:${widget.y}"),
          Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
                mainAxisSize: MainAxisSize.min,
                children: widget.pathsObj
                    .map((path) => Image.asset(
                          path,
                          scale: widget.scale,
                        ))
                    .toList()),
            Row(
                mainAxisSize: MainAxisSize.min,
                children: widget.pathsGround
                    .map((path) => Image.asset(
                          path,
                          scale: widget.scale,
                        ))
                    .toList()),
          ]),
        ]));
  }
}
