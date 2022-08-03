class GameObjects {
  List<String> pathsObj;
  List<String> pathsGround;
  double x;
  double y;
  double scale;
  double height;
  GameObjects(this.pathsObj, this.x, this.y,
      {this.scale: 1, this.pathsGround: const [], this.height: 0});
}
