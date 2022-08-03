import 'package:flutter/material.dart';

class Ground extends StatelessWidget {
  final String path;
  Ground({this.path});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        path,
        scale: 1,
      ),
    );
  }
}
