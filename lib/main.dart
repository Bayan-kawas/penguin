import 'package:flutter/material.dart';
import 'fetchOnImages.dart';
import 'gameCard.dart';



void main() {
  getCardsForGame();
  for (var i = 0; i < 12; i++) {
    gameCards.add(GameCard(index: i));
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
MyApp();
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
            title: Row(
            children: <Widget>[
              Center(
                child: Text("penguin game"),
              ),
              Container(
               child:  Row(
                mainAxisAlignment:MainAxisAlignment.end,
                 children: <Widget>[
                  Icon(
                    Icons.add,
                  ),

                   Text("$total",
                   ),
                 ],
               ),
              )
            ],
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

