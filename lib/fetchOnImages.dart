
Map images ={
  'cat':'assets/images/cat.png',
  'penguin':'assets/images/penguin.jpg',
  'duck':'assets/images/duck.gif',
  'tiger':'assets/images/tiger.jpg',
  'fish':'assets/images/fish.png',
  'bear':'assets/images/bear.png',
};
List list=[];
List getCardsForGame(){
   list = images.keys.toList(); // get al ist of the keys of the map
  list.addAll([]..addAll(list));
  list.shuffle(); // shuffle the elements of the list
  return list;
}

String gitItemOfList(int i){
  return list[i];
}


