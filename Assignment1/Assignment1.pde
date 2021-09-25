color bgColor1 = color(0, 0, 0);
color bgColor2 = color(255, 255, 255); 

void setup(){
  size(800, 600, P2D);
  background(bgColor1);
}

void draw(){
  float circleSize = random(5);
  ellipseMode(CENTER);
  
  if (mousePressed){
    fill(random(256), random(256), random(256));
    stroke(random(256), random(256), random(256));
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      background(bgColor1);
    }  else if (keyCode == DOWN) {
      background(bgColor2);
    }
  }
}
