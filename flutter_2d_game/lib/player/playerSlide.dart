import 'package:flutter/material.dart';
import 'package:flutter_2d_game/player/player.dart';

class PlayerSlide extends StatefulWidget {
  @override
  _PlayerSlideState createState() => _PlayerSlideState();
}

class _PlayerSlideState extends State<PlayerSlide>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<int> slidingAnimation;
  List<String> paths = [
    "assets/NinjaGirl/Slide__000.png",
    "assets/NinjaGirl/Slide__001.png",
    "assets/NinjaGirl/Slide__002.png",
    "assets/NinjaGirl/Slide__003.png",
    "assets/NinjaGirl/Slide__004.png",
    "assets/NinjaGirl/Slide__005.png",
    "assets/NinjaGirl/Slide__006.png",
    "assets/NinjaGirl/Slide__007.png",
    "assets/NinjaGirl/Slide__008.png",
    "assets/NinjaGirl/Slide__009.png",
  ];
  double start = 0, end = 8;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    slidingAnimation = IntTween(begin: 0, end: 8).animate(controller);
    /*SlideingAnimation.addListener(() {
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
      animation: slidingAnimation,
      builder: (context, child) {
        return Container(child: Player(path: paths[slidingAnimation.value]));
      },
    );
  }
}
