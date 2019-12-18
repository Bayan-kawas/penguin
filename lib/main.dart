import 'package:flutter/material.dart';
import 'dart:math';
import 'fetchOnImages.dart';

void main() {
  getCardsForGame();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int i = 0;
  String imgCover = 'assets/images/cover.png';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("penguin game"),
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    GameCard(index: 0),
                    GameCard(index: 1),
                    GameCard(index: 2),
                    GameCard(index: 3),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    GameCard(index: 4),
                    GameCard(index: 5),
                    GameCard(index: 6),
                    GameCard(index: 7),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    GameCard(index: 8),
                    GameCard(index: 9),
                    GameCard(index: 10),
                    GameCard(index: 11),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class GameCard extends StatefulWidget {
  int index;

  GameCard({Key key, this.index}) : super(key: key);

  @override
  _GameCardState createState() => _GameCardState(index: index);
}

class _GameCardState extends State<GameCard> {
  int index;
  String imagePath;
  bool isOnBack = true;

  String imgCover = 'assets/images/cover.png';

  _GameCardState({this.index});


  void initState() {
    super.initState();
    imagePath = imgCover;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FlatButton(
          onPressed: () {
            setState(() {
              if(isOnBack){
                print("this is");
                print(index);
                imagePath = images[getItemOfList(index)];
              }else{
                imagePath = imgCover;
              }
            });
            this.isOnBack = ! this.isOnBack;
          },
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
