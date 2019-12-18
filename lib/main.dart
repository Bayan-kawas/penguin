import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';
import 'fetchOnImages.dart';
import "dart:async";

List gameCards = [];
var cardsOnFront = [];

void main() {
  getCardsForGame();
  for (var i = 0; i < 12; i++) {
    gameCards.add(GameCard(index: i));
  }
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
                    gameCards[0],
                    gameCards[1],
                    gameCards[2],
                    gameCards[3],
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    gameCards[4],
                    gameCards[5],
                    gameCards[6],
                    gameCards[7],
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    gameCards[8],
                    gameCards[9],
                    gameCards[10],
                    gameCards[11],
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
  _GameCardState state;

  GameCard({Key key, this.index}) : super(key: key);

  void clearImage(){
    state.clearMe();
  }

  void flipOnBack(){
    state.flipOnBack();
  }

  @override
  _GameCardState createState() {
    state = _GameCardState(index: index);
    return state;
  }

}

class _GameCardState extends State<GameCard> {
  int index;
  String imagePath;
  bool isOnBack = true;
  bool done = false;

  String imgCover = 'assets/images/cover.png';

  _GameCardState({this.index});

  void initState() {
    super.initState();
    imagePath = imgCover;
  }

  void clearMe() {
    setState(() {
      done = true;
    });
  }
  void flipOnBack(){
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
            if (! isOnBack || cardsOnFront.length == 2) {
              return;
            }

            setState(() {

              cardsOnFront.add({
                'name': getItemOfList(index),
                'index': index
              });

              imagePath = images[getItemOfList(index)];
              isOnBack = false;

              if (cardsOnFront.length == 2 && cardsOnFront[0]['name'] == cardsOnFront[1]['name']) {
                new Future.delayed(Duration(seconds : 1), (){
                  for (var i = 0; i < cardsOnFront.length; i++) {
                    gameCards[cardsOnFront[i]['index']].clearImage();
                  }
                  cardsOnFront = [];
                });

                return;
              }

              if(cardsOnFront.length == 2){
                new Future.delayed(Duration(seconds : 2), (){
                  for(var i=0; i< cardsOnFront.length; i++){
                    gameCards[cardsOnFront[i]['index']].flipOnBack();
                  }
                  cardsOnFront = [];
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
