PImage back, dio, eren, godzilla, jotaro, kong, asteroid, powerpuff;
float x1, x2, x, theta;
PImage[] images = new PImage[5];

void setup() {
  size(1309, 360, P2D);

  //Load the images
  back = loadImage("background.jpeg");
  dio = loadImage("dio.png");
  eren = loadImage("eren.png");
  godzilla = loadImage("godzilla.png");
  jotaro = loadImage("jotaro.png");
  kong = loadImage("kong.png");
  powerpuff = loadImage("powerpuff.png");
  asteroid = loadImage("asteroid.png");
  
  //Resise Images
  back.resize(back.width * (height / back.height), height);
  dio.resize(dio.width * (height / dio.height), height);
  eren.resize(eren.width * (height / eren.height), height);
  godzilla.resize(godzilla.width * (height / godzilla.height), height);
  jotaro.resize(jotaro.width * (height / jotaro.height), height);
  kong.resize(kong.width * (height / kong.height), height);
  asteroid.resize(asteroid.width * (height / asteroid.height), height);
  powerpuff.resize(150, 150);
  
  //Put images in array
  images[0] = dio;
  images[1] = eren;
  images[2] = godzilla;
  images[3] = jotaro;
  images[4] = kong; 
  

  theta = 0.0;
  x1 = 0;
  x2 = 1309;
}

void draw() {
  //parralax background
  image(back, x1, 0);
  image(back, x2, 0);

  x1-=10; x2-=10; spawn++;
  
  if (x1 < -1309) {
    x1 = 1309;
  }
  if (x2 < -1309) {
    x2 = 1309;
    //Change Enemy
    x = random(0,5);
  }
   
  //Spawn Enemy
  image(images[int(x)], x2, 0);
  
  //Spawn Fireball
  if(x2 > 80 && x2 < 120){
    image(asteroid, 0, 0);
  }
  
  //Control powerpuff girls movement
  float y = (sin(theta) + 3) * 20;
  theta += 0.05;
  image(powerpuff, 100, y);
}
