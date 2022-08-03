import 'package:flutter/material.dart';
import 'package:flutter_2d_game/player/player.dart';

class PlayerJump extends StatefulWidget {
  @override
  _PlayerJumpState createState() => _PlayerJumpState();
}

class _PlayerJumpState extends State<PlayerJump> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<int> jumpingAnimation;
  List<String> paths = [
    "assets/NinjaGirl/Jump__000.png",
    "assets/NinjaGirl/Jump__001.png",
    "assets/NinjaGirl/Jump__002.png",
    "assets/NinjaGirl/Jump__003.png",
    "assets/NinjaGirl/Jump__004.png",
    "assets/NinjaGirl/Jump__005.png",
    "assets/NinjaGirl/Jump__006.png",
    "assets/NinjaGirl/Jump__007.png",
    "assets/NinjaGirl/Jump__008.png",
    "assets/NinjaGirl/Jump__009.png",
  ];
  double start = 0, end = 8;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    jumpingAnimation = IntTween(begin: 0, end: 8).animate(controller);
    /*jumpingAnimation.addListener(() {
      if (controller.isCompleted) {
        controller.reverse();
      }
    });*/
    controller.forward().whenComplete(() {
      controller.reverse();
    });
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
      animation: jumpingAnimation,
      builder: (context, child) {
        return Container(child: Player(path: paths[jumpingAnimation.value]));
      },
    );
  }
}
