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
          child: Container(
            height: 200,
            width: 400,
            child: Card(
              child: Padding(
                padding:EdgeInsets.all(40),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "you are won with $movement movement ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.pinkAccent,
                          fontSize: 18
                        ),
                      ),
                    ),
                    FlatButton(
                      color: Colors.grey,
                      onPressed: () {
                        getCardsForGame();
                        total=0;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Restart Game",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(1.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
