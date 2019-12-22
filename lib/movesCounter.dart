import 'package:flutter/material.dart';
class MovesCounter extends StatefulWidget {
  _MovesCounterState state;

  @override
  _MovesCounterState createState() {
    state = _MovesCounterState();
    return state;
  }

  void increment() {
    state.increment();
  }
}

class _MovesCounterState extends State<MovesCounter> {
  int moves = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.add,
          ),
          Text(
            "$moves",
          ),
        ],
      ),
    );
  }

  void increment() {
    setState(() {
      moves++;
    });
  }
}
