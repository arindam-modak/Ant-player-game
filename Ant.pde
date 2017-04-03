class Ant {
  //Members - variables of the object the class creates. (attributes)
  float x, y;
  PVector speed;
  int bodySize; 
  PImage img;
  //Constructor - initializes the variables, or the settings of the object that the class creates. (sets up those attributes)
  Ant() {
    x = random(50, 450);
    y = random(50, 450);
    img = loadImage("C:\\Users\\arindam das modak\\Desktop\\Processing projects\\basic_Processing\\ant.jpg");
    speed = new PVector(random(-0.8, 0.8), random(-0.8, 0.8));
  }
 
  //Methods - functions of the object that the class   creates. (abilities of the object)
  void drawAnt() {
    moveAnt();
    pushMatrix();
    translate(x + img.width/2, y + img.height/2);
    rotate(speed.heading() + 0);
    translate(-img.width/2, -img.height/2);
    image(img, 0, 0);
    popMatrix();
    
    
  }
 
  void moveAnt() {
    float testMove = random(0, 1);
    if(testMove < 0.1)
      speed.rotate(random(-0.3, 0.3));
    if(testMove > 0.97)
      speed.rotate(random(-1, 1));
 
    x = x + speed.x;
    y = y + speed.y;
 
    if(isAntOffScreen() == true) {
      x = x - speed.x;
      y = y - speed.y;
      speed.rotate(random(-2, 2));
    }
  }
 
  boolean isAntOffScreen() {
    if(x < 10 || x > width - 40 ||
       y < 10 || y > height - 40)
    return true;
    return false;
  }
}