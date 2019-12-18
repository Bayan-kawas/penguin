import 'package:flutter/material.dart';
import 'dart:math';
import 'fetchOnImages.dart';

void main() {
  print(getCardsForGame());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int i=0;
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
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              imgCover =images[gitItemOfList(0)];
                            });
                            print(imgCover);
                            },
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {
                          },
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {
                          },
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {
                            // imgCover =Image.asset('assets/images/img$randomNumber.jpg');
                            //print(imgCover);
                          },
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {
                            // imgCover =Image.asset('assets/images/img$randomNumber.jpg');
                            //print(imgCover);
                          },
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: Image.asset(imgCover),
                        ),
                      ),
                    ),
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
