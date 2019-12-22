import 'package:flutter/material.dart';
import "dart:async";
import 'resultpage.dart';
import 'globals.dart';

class GameCard extends StatefulWidget {
  int index;
  _GameCardState state;

  GameCard({Key key, this.index}) : super(key: key);

  void clearImage() {
    state.clearMe();
  }

  void flipOnBack() {
    state.flipOnBack();
  }

  @override
  _GameCardState createState() {
    state = _GameCardState(index: index);
    return state;
  }
}

class _GameCardState extends State<GameCard> {
  _GameCardState({this.index});

  int index;
  String imagePath;
  bool isOnBack = true;
  bool done = false;

  String imgCover = 'assets/images/cover.png';

  void initState() {
    super.initState();
    imagePath = imgCover;
  }

  void clearMe() {
    setState(() {
      done = true;
    });
  }

  void flipOnBack() {
    setState(() {
      imagePath = imgCover;
      isOnBack = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FlatButton(
          onPressed: () {
            if (!isOnBack || cardsOnFront.length == 2) {
              return;
            }

            setState(() {
              cardsOnFront.add({'name': getItemOfList(index), 'index': index});

              imagePath = images[getItemOfList(index)];
              isOnBack = false;

              if (cardsOnFront.length == 2 &&
                  cardsOnFront[0]['name'] == cardsOnFront[1]['name']) {
                new Future.delayed(Duration(milliseconds: 500), () {
                  for (var i = 0; i < cardsOnFront.length; i++) {
                    gameCards[cardsOnFront[i]['index']].clearImage();
                  }
                  cardsOnFront = [];
                  wins++;
                  if (wins == 6) {
                    movement = wins + efforts;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result()),
                    );
                  }
                });
                movesCounter.increment();
                return;
              }

              if (cardsOnFront.length == 2) {
                new Future.delayed(Duration(milliseconds: 500), () {
                  for (var i = 0; i < cardsOnFront.length; i++) {
                    gameCards[cardsOnFront[i]['index']].flipOnBack();
                  }
                  cardsOnFront = [];
                  efforts++;
                });
                movesCounter.increment();
              }
            });
          },
          child: showCard(imagePath, done),
        ),
      ),
    );
  }
}

Widget showCard(path, done) {
  return done ? Text("") : Image.asset(path);
}
