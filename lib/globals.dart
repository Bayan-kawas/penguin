import 'gameCard.dart';
import 'movesCounter.dart';
import 'package:shared_preferences/shared_preferences.dart';

var cardsOnFront = [];
List gameCards;
int wins = 0;
int efforts = 0;
int movement;
var movesCounter;
SharedPreferences prefs;

Map images = {
  'cat': 'assets/images/cat.png',
  'penguin': 'assets/images/penguin.jpg',
  'duck': 'assets/images/duck.gif',
  'tiger': 'assets/images/tiger.jpg',
  'fish': 'assets/images/fish.png',
  'bear': 'assets/images/bear.png',
};
List list = [];

List getCardsForGame() {
  list = images.keys.toList(); // get al ist of the keys of the map
  list.addAll([]..addAll(list));
  list.shuffle(); // shuffle the elements of the list
  return list;
}

String getItemOfList(int i) {
  return list[i];
}

void initGameCards() {
  gameCards = [];
  for (var i = 0; i < 12; i++) {
    gameCards.add(GameCard(index: i));
  }
}

void startGame() {
  cardsOnFront = [];
  wins = 0;
  efforts = 0;
  movement = 0;
  movesCounter = MovesCounter();
  getCardsForGame();
  initGameCards();
}
