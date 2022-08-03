import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_2d_game/ground/moveGround.dart';
import 'package:flutter_2d_game/object/screenObject.dart';
import 'package:flutter_2d_game/player/playerIdle.dart';
import 'package:flutter_2d_game/player/playerJump.dart';
import 'package:flutter_2d_game/player/playerRun.dart';
import 'package:flutter_2d_game/player/playerSlide.dart';
import 'package:flutter_2d_game/store/game_store.dart';

import 'object/object.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0, playerSpeed = 2;
  double playerX = -0.5, playerY = 1;
  GameStore game = new GameStore();

  Widget player = PlayerIdle();
  MoveGround ground = MoveGround();
  List<GameObjects> objects = <GameObjects>[];
  Random rand = new Random();

  Offset drag = Offset.zero;

  int aux = 0;
  void refreshPlayer() {
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (game.isRunning) {
        setState(() {
          ground.move();
          moveObjects();
          double newY = playerY;

          if (game.isAbove && game.above > -1) {
            if (playerY < objects[game.above].y &&
                (playerX - objects[game.above].x).abs() > 0.4) {
              newY = 1;
              game.jumpDown();
            }
          } else
            newY = 1;

          // for (var i = 0; i < objects.length; i++) {
          //   // newY = 1 - 0.8 - objects[i].y;
          //   if (playerY < objects[i].y &&
          //       (playerX - objects[i].x).abs() > 0.4) {
          //     newY = 1;
          //     game.jumpDown();
          //     print(
          //         "TAERRADOOOO = ${(playerX - objects[i].x).abs()} pX:$playerX objX ${objects[i].x}");
          //     break;
          //   }
          // }
          setState(() {
            playerY = newY;
          });
        });
      } else
        timer.cancel();
    });
  }

  void jump() {
    setState(() {
      player = PlayerJump();
      if (playerY > -1) playerY -= 1;
    });
    Future.delayed(Duration(milliseconds: 500), () async {
      setState(() {
        player = PlayerIdle();
        //playerY = 1;
      });
    });
    Future.delayed(Duration(milliseconds: 250), () async {
      double newY = 1;
      for (var i = 0; i < objects.length; i++) {
        print("HEIGHT: ${objects[i].height}");
        // print("SCALE: ${objects[i].scale}");
        if (playerY < objects[i].y && (playerX - objects[i].x).abs() <= 0.4) {
          newY = objects[i].y - objects[i].height;
          game.jumpAbove(i);
        }
      }
      setState(() {
        playerY = newY;
        print("playerY:$playerY");
      });
    });
  }

  void slide() {
    setState(() {
      player = PlayerSlide();

      /// if (playerY > -1) playerY -= 1;
    });
    Future.delayed(Duration(milliseconds: 500), () async {
      setState(() {
        player = PlayerIdle();
        //playerY = 1;
      });
    });
    Future.delayed(Duration(milliseconds: 250), () async {
      double newY = 1;
      for (var i = 0; i < objects.length; i++) {
        if (playerY < objects[i].y && (playerX - objects[i].x).abs() <= 0.4) {
          newY = objects[i].y;
          // newY = (-objects[i].height + objects[i].y);
        }
      }
      setState(() {
        playerY = newY;
      });
    });
  }

  void updatePlayerHigh() {}

  void moveObjects() {
    for (var i = 0; i < objects.length; i++) {
      setState(() {
        objects[i].x -= 0.01;
      });
    }
  }

  double randY() {
    double randy = rand.nextBool()
        ? rand.nextDouble() + rand.nextInt(2)
        : -1 * (rand.nextDouble() + rand.nextInt(2));

    print(randy);
    return randy;
  }

  double objY = 1;
  @override
  void initState() {
    // TODO: implement initState
    objects.add(new GameObjects(
        ["assets/Object/Bush (1).png"], rand.nextDouble(), objY));
    objects.add(new GameObjects(["assets/Object/Bush (2).png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Bush (3).png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Bush (4).png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Crate.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/MushRoom_1.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/MushRoom_2.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Sign_1.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Sign_2.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Stone.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Tree_1.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Tree_2.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Tree_3.png"],
        rand.nextDouble() + objects.last.x + 1, objY));
    objects.add(new GameObjects(["assets/Object/Crate.png"], -0.5, 0.5,
        scale: 2,
        pathsGround: [
          "assets/Tiles/13.png",
          "assets/Tiles/14.png",
          "assets/Tiles/15.png"
        ],
        height: 0.3));
    objects.add(new GameObjects([], 1, 0.3,
        scale: 2,
        pathsGround: [
          "assets/Tiles/13.png",
          "assets/Tiles/14.png",
          "assets/Tiles/15.png"
        ],
        height: 0.4));

    super.initState();
  }

  double tileScale = 2;
  List<LogicalKeyboardKey> keys = [];
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        final key = event.logicalKey;
        if (event is RawKeyDownEvent) {
          if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
            jump();
          }
          if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
            slide();
          }

          if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            game.run();
            setState(() {
              player = PlayerRun();
            });
            refreshPlayer();
          }

          setState(() {
            keys.add(key);
          });
        } else {
          setState(() {
            keys.remove(key);
          });

          game.stop();
          setState(() {
            player = PlayerIdle();
          });
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(randY());
          },
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Background/BG.png"),
                    fit: BoxFit.cover)),
            child: Stack(children: [
              Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          // ScreenObject(
                          //   pathsGround: [
                          //     "assets/Tiles/13.png",
                          //     "assets/Tiles/14.png",
                          //     "assets/Tiles/15.png"
                          //   ],
                          //   x: -0.5,
                          //   y: 0.5,
                          //   scale: 2,
                          // ),
                          // AnimatedContainer(
                          //   duration: Duration(seconds: 0),
                          //   alignment: Alignment(0.5, 0),
                          //   child: Row(mainAxisSize: MainAxisSize.min, children: [
                          //     Image.asset(
                          //       "assets/Tiles/13.png",
                          //       scale: tileScale,
                          //     ),
                          //     Image.asset(
                          //       "assets/Tiles/14.png",
                          //       scale: tileScale,
                          //     ),
                          //     Image.asset(
                          //       "assets/Tiles/15.png",
                          //       scale: tileScale,
                          //     )
                          //   ]),
                          // ),
                          // AnimatedContainer(
                          //   duration: Duration(seconds: 0),
                          //   alignment: Alignment(0.5, -0.5),
                          //   child: Image.asset(
                          //     "assets/Object/Crate.png",
                          //     scale: tileScale,
                          //   ),
                          // ),
                          // ScreenObject(
                          //   paths: ["assets/Object/Crate.png"],
                          //   x: 1,
                          //   y: 1,
                          // ),
                          Stack(
                              children: objects
                                  .map((e) => ScreenObject(
                                        pathsObj: e.pathsObj,
                                        pathsGround: e.pathsGround,
                                        x: e.x,
                                        y: e.y,
                                        scale: 2,
                                      ))
                                  // AnimatedContainer(
                                  //       duration: Duration(milliseconds: 1),
                                  //       alignment: Alignment(e.x, 1),
                                  //       child: Image.asset(
                                  //         e.path,
                                  //       ),
                                  //     ))
                                  .toList()),
                          AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              alignment: Alignment(playerX, playerY),
                              child: Stack(
                                children: [
                                  Container(
                                    child: player,
                                    transform: Matrix4.rotationY(0),
                                  ),
                                  Text("X:$playerX, Y:$playerY"),
                                ],
                              )),
                        ],
                      )),
                  Expanded(flex: 1, child: ground)
                ],
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                child: GestureDetector(
                  onLongPressStart: (LongPressStartDetails details) {
                    //game.isRunning = true;
                    game.run();
                    setState(() {
                      player = PlayerRun();
                    });
                    refreshPlayer();
                  },
                  onLongPressUp: () {
                    // game.isRunning = false;
                    game.stop();
                    setState(() {
                      player = PlayerIdle();
                    });
                  },
                  onVerticalDragUpdate: (details) {
                    if (details.localPosition.dy < drag.dy) {
                      jump();
                    } else {
                      slide();
                    }
                  },
                  onVerticalDragStart: (details) {
                    drag = details.localPosition;
                  },
                ),
              ),
            ])),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: GestureDetector(
        //     onLongPressStart: (LongPressStartDetails details) {
        //       isRunning = true;
        //       setState(() {
        //         player = PlayerRun();
        //       });
        //       refreshPlayer();
        //     },
        //     onLongPressUp: () {
        //       isRunning = false;
        //       setState(() {
        //         player = PlayerIdle();
        //       });
        //     },
        //   ),
        // ),
      ),
    );
  }
}
