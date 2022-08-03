import 'dart:async';

import 'package:flutter/material.dart';

class MoveGround extends StatefulWidget {
  Function move;

  MoveGround();

  @override
  _MoveGroundState createState() => _MoveGroundState();
}

class _MoveGroundState extends State<MoveGround> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<int> animation;
  int aux = 0;
  List<String> paths = [
    "assets/Tiles/2.png",
    "assets/Tiles/2.png",
    "assets/Tiles/2.png",
    "assets/Tiles/2.png",
    "assets/Tiles/2.png",
    "assets/Tiles/2.png",
    "assets/Tiles/2.png",
    "assets/Tiles/2.png",
    "assets/Tiles/2.png",
  ];
  List<String> p = [
    "assets/Tiles/1.png",
    "assets/Tiles/2.png",
    "assets/Tiles/3.png",
    "assets/Tiles/4.png",
    "assets/Tiles/5.png",
    "assets/Tiles/6.png",
    "assets/Tiles/7.png",
    "assets/Tiles/8.png",
    "assets/Tiles/9.png",
    "assets/Tiles/10.png",
    "assets/Tiles/11.png",
    "assets/Tiles/12.png",
    "assets/Tiles/13.png",
    "assets/Tiles/14.png",
    "assets/Tiles/15.png",
    "assets/Tiles/16.png",
    "assets/Tiles/17.png",
    "assets/Tiles/18.png",
  ];
  @override
  void initState() {
    // TODO: implement initState
    widget.move = move;
    super.initState();
  }

  void move() {
    setState(() {
      if (aux < 9 - 6)
        aux++;
      else {
        aux = 0;
        // paths.sort();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(seconds: 3),
        //alignment: Alignment(playerX, playerY),
        child: Container(
            width: double.infinity,
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: Image.asset(
                paths[0 + aux],
                repeat: ImageRepeat.repeatX,
              )),
              Expanded(
                  child: Image.asset(
                paths[1 + aux],
                repeat: ImageRepeat.repeatX,
              )),
              Expanded(
                  child: Image.asset(
                paths[2 + aux],
                repeat: ImageRepeat.repeatX,
              )),
              Expanded(
                  child: Image.asset(
                paths[3 + aux],
                repeat: ImageRepeat.repeatX,
              )),
              Expanded(
                  child: Image.asset(
                paths[4 + aux],
                repeat: ImageRepeat.repeatX,
              )),
              Expanded(
                  child: Image.asset(
                paths[5 + aux],
                repeat: ImageRepeat.repeatX,
              )),
              // Expanded(
              //     child: Row(children: [
              //   Image.asset(
              //     "assets/Tiles/13.png",
              //   ),
              //   Image.asset(
              //     "assets/Tiles/14.png",
              //   ),
              //   Image.asset(
              //     "assets/Tiles/15.png",
              //   )
              // ])),
            ])));
  }
}
