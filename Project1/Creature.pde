class Creature{
  float posX, posY, growth, dist, max, angle, radius;
  boolean child;
  PVector center;
  PImage navi;
  Creature parent;
  
  Creature(boolean val, Creature who){
    posX = random(40,400);
    posY = random(40,400);
    growth = 20;
    child = val;
    parent = who;
    dist = random(-1,1);
    max = random(35,45);
    navi = loadImage("navi.png");
  }
  
  void display(){
    image(navi, posX, posY, growth, growth);
    this.move();
  }
  
  void move(){
    this.lerp();
    this.circle();
    this.correct();
    this.grow();
  }
  
  //Get points that circle around the parent creature.
  void getCircle(){
    center = new PVector(parent.posX, parent.posY);
    PVector point = new PVector(posX, posY);
    
    float deltaX = center.x - point.x + random(10);
    float deltaY = center.y - point.y + random(10);
    angle = atan2(deltaX, deltaY);
    
    radius = dist(center.x, center.y, point.x, point.y) + random(10);
    ellipseMode(RADIUS);
  }
  
  //Not working as intended! But i left it because effect is pretty cool
  void circle(){
    this.getCircle();
    if(!child){
    }else{
      posX = center.x + cos(angle)*radius;
      posY = center.y + sin(angle)*radius;
    }
    
    angle += PI/120;
  }
  
  
  //Smooth instead of janky movement
  void lerp(){
    if(!child){
      //Linear interpolation formula  a + (b -a ) * x
      if(posX != mouseX){
       posX =  posX + (mouseX - posX ) * (0.05);
      } 
      if(posY != mouseY){
       posY =  posY + (mouseY - posY ) * (0.05);
      }
    }else{
      if(posX != parent.posX){
       posX =  posX + (parent.posX - posX ) * (0.05);
      } 
      if(posY != parent.posY ){
       posY =  posY + (parent.posY - posY) * (0.05);
      }
    }
  }
  
  //Grow to a certain size then pop
  void grow(){
    if(!child){
      if (growth < 50){
      growth += 0.05;
      }else{
        growth = 1;
      }
    }else{
      if (growth < max){
      growth +=random(0.03,0.01);
      }else{
        growth = 1;
      }
    }
  }
  
  
  //Don't go out of bounds
  void correct(){
    if(posX >= width){
      posX = width;
    }
    if(posX <= 0){
      posX = 0;
    }
    if(posY >= height){
      posY = height;
    }
    if(posY <= 0){
      posY = 0;
    }
  }
}
