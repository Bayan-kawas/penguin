import 'package:flutter/material.dart';
import "dart:async";
import 'resultpage.dart';
import 'globals.dart';

class GameCard extends StatefulWidget {
  int index;
  var image;
  _GameCardState state;

  GameCard({Key key, this.image, this.index}) : super(key: key);

  @override
  _GameCardState createState() {
    state = _GameCardState(image: this.image, index: this.index);
    return state;
  }
}

class _GameCardState extends State<GameCard> {
  _GameCardState({this.image, this.index});

  var image;
  int index;
  String imagePath;
  bool isOnBack = true;
  bool done = false;

  String imgCover = 'assets/images/cover.png';

  void initState() {
    super.initState();
    imagePath = imgCover;
  }

  void clearImage() {
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
  bool isSameAs(String key){
    return this.image['key']== key;
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
              cardsOnFront.add(this);

              imagePath = image['path'];
              isOnBack = false;

              if (cardsOnFront.length == 2 && cardsOnFront[0].isSameAs(this.image['key'])) {
                new Future.delayed(Duration(milliseconds: 500), () {
                  for (var i = 0; i < cardsOnFront.length; i++) {
                    cardsOnFront[i].clearImage();
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
                    cardsOnFront[i].flipOnBack();
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
