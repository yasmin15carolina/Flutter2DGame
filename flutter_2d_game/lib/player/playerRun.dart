import 'package:flutter/material.dart';
import 'package:flutter_2d_game/player/player.dart';

class PlayerRun extends StatefulWidget {
  @override
  _PlayerRunState createState() => _PlayerRunState();
}

class _PlayerRunState extends State<PlayerRun> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<int> runningAnimation;
  List<String> paths = [
    "assets/NinjaGirl/Run__000.png",
    "assets/NinjaGirl/Run__001.png",
    "assets/NinjaGirl/Run__002.png",
    "assets/NinjaGirl/Run__003.png",
    "assets/NinjaGirl/Run__004.png",
    "assets/NinjaGirl/Run__005.png",
    "assets/NinjaGirl/Run__006.png",
    "assets/NinjaGirl/Run__007.png",
    "assets/NinjaGirl/Run__008.png",
    "assets/NinjaGirl/Run__009.png",
  ];
  double start = 0, end = 8;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    runningAnimation = IntTween(begin: 0, end: 8).animate(controller);
    runningAnimation.addListener(() {
      if (controller.isCompleted) {
        controller.reset();
        controller.forward();
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: runningAnimation,
      builder: (context, child) {
        return Container(child: Player(path: paths[runningAnimation.value]));
      },
    );
  }
}
