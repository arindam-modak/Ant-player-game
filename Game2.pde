ArrayList <Ant> ants = new ArrayList<Ant>();
int numAnts = 30; 
PImage bg;
boolean [] keys;
Player player;

void setup() {
  size(600, 600);
  frameRate(60);
  bg = loadImage("C:\\Users\\arindam das modak\\Desktop\\Processing projects\\basic_Processing\\grass.jpg");
  player = new Player();
  for (int i = 0; i < numAnts; i++)
    ants.add(new Ant());
  keys = new boolean[128];
}
 
void draw() {
  //background(bg);
  background(255);
  
  move();
  player.drawPlayer();
  for (int i = 0; i < numAnts; i++)
    ants.get(i).drawAnt();
}

void move() {
  int xdelta = 0;
  int ydelta = 0;
  if (keys['w'])
    ydelta--;
  if (keys['s'])
    ydelta++;
  if (keys['a'])
    xdelta--;
  if (keys['d'])
    xdelta++;
  
  player.updatePlayer(xdelta, ydelta);
}

void keyPressed() {
  keys[key] = true;
}

void keyReleased() {
  keys[key] = false;
}