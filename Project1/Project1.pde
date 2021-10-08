//circle logic gotten from https://stackoverflow.com/questions/34842502/processing-how-do-i-make-an-object-move-in-a-circular-path
//class logic gotten from The Coding Train 9:Arrays - Proccesing Tutorial and 8:Classes - Proccesing Tutorial
//Everything else gotten from class, prexisting knowledge and the processing docs

Creature[] creatures = new Creature[200];
PImage back;

void setup(){
  fullScreen(P2D);
  
  //Load and resize background
  back = loadImage("background.jpeg");
  back.resize(back.width * (height / back.height), height);
  
  //Parent Creature
  creatures[0] = new Creature(false, creatures[0]);
  creatures[0].parent = creatures[0];
  Creature parent = creatures[0];
  
  //Generating other creatures
  for (int i = 1; i < creatures.length; i++){
    boolean child = true;
    creatures[i] = new Creature(child, parent); 
  }
}

void draw(){
  image(back,0,0);
  
  //Creature action
  for (int i = 0; i < creatures.length; i++){
    creatures[i].display(); 
  }
}
