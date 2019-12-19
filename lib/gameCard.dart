import 'package:flutter/material.dart';
import 'fetchOnImages.dart';
import "dart:async";
import 'resultpage.dart';
var cardsOnFront = [];
List gameCards = [];
int wins = 0;
int efforts = 0;
int movement;
int total=0;

class GameCard extends StatefulWidget {
  int index;
  _GameCardState state;

  GameCard({Key key, this.index}) : super(key: key);

  void clearImage() {
    state.clearMe();
    print(gameCards.length);
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
 void counter(){
    setState(() {
      total++;
      print(total);
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
                new Future.delayed(Duration(seconds: 1), () {
                  for (var i = 0; i < cardsOnFront.length; i++) {
                    gameCards[cardsOnFront[i]['index']].clearImage();
                  }
                  cardsOnFront = [];
                    wins++;
                  counter();
                  if(wins == 6){
                    movement = wins + efforts;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result() ),
                    );
                  }
                });

                return;
              }

              if (cardsOnFront.length == 2) {
                new Future.delayed(Duration(seconds: 2), () {
                  for (var i = 0; i < cardsOnFront.length; i++) {
                    gameCards[cardsOnFront[i]['index']].flipOnBack();
                  }
                  cardsOnFront = [];
                  efforts++;
                  counter();
                });
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

