import 'package:flutter/material.dart';
import 'package:penguin/gameCard.dart';
import 'main.dart';
import 'fetchOnImages.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("penguin game"),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("you are won with $movement movement "),
              FlatButton(
                onPressed: () {
                  getCardsForGame();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text("Restart Game"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
