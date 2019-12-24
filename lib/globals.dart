import 'gameCard.dart';
import 'movesCounter.dart';
import 'package:shared_preferences/shared_preferences.dart';

var cardsOnFront = [];
List gameCards;
int wins = 0;
int moves = 0;
var movesCounter;
SharedPreferences prefs;

var images = [
  {
    "key" : "cat",
    "path" : "assets/images/cat.png",
  },
  {
    "key" : "penguin",
    "path" : "assets/images/penguin.jpg",
  },
  {
    "key" : "duck",
    "path" : "assets/images/duck.gif",
  },
  {
    "key" : "tiger",
    "path" : "assets/images/tiger.jpg",
  },
  {
    "key" : "fish",
    "path" : "assets/images/fish.png",
  },
  {
    "key" : "bear",
    "path" : "assets/images/bear.png",
  },
];


void initGameCards() {
  gameCards = [];
  for (var i = 0; i < 12; i++) {
    gameCards.add(GameCard(image : images[i % 6], index: i));
  }
  gameCards.shuffle();
}

void startGame() {
  cardsOnFront = [];
  wins = moves = 0;
  movesCounter = MovesCounter();
  initGameCards();
}
