import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String path;
  Player({this.path: "assets/MalePlayer/Idle__000.png"});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        path,
        scale: 4,
      ),
    );
  }
}
