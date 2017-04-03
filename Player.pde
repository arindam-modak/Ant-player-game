class Player {
  float x, y;
  PImage spriteSheet;
  PImage [][] movement;
  boolean inMotion;
  int currentDirection;
  float currentFrame;
  
  final int UP = 0, LEFT = 1, DOWN = 2, RIGHT = 3;
  
  Player() {
    inMotion = false;
    currentDirection = 1;
    currentFrame = 0;
    x = 300;
    y = 300;
    SetupSprites();
  }
  
  void SetupSprites() {
    movement = new PImage[4][9];
    spriteSheet = loadImage("C:\\Users\\arindam das modak\\Desktop\\Processing projects\\basic_Processing\\professor.jpg");
    for (int i = 0; i < 9; i++) {
      movement[0][i] = spriteSheet.get(16 + 64 * i, 8, 32, 56);
      movement[1][i] = spriteSheet.get(16 + 64 * i, 72, 32, 56);
      movement[2][i] = spriteSheet.get(16 + 64 * i, 136, 32, 56);
      movement[3][i] = spriteSheet.get(16 + 64 * i, 200, 32, 56);
    }
  }
  
  void drawPlayer() {
    if (inMotion)
      image(movement[currentDirection][1 + int(currentFrame)], x, y);
    else
      image(movement[currentDirection][0], x, y);
    
  }
  
  void updatePlayer(int xdelta, int ydelta) {
    currentFrame = (currentFrame + 0.4) % 8;  // this 0.4 controls the speed of movement of player
    inMotion = true;
    
    if (xdelta == 0 && ydelta == 0)
      inMotion = false;
    else if(xdelta == -1)
      currentDirection = LEFT;
    else if(xdelta == 1)
      currentDirection = RIGHT;
    else if(ydelta == -1)
      currentDirection = UP;
    else if(ydelta == 1)
      currentDirection = DOWN;
    
    x = x + xdelta;
    y = y + ydelta;
    if (isPlayerOfScreen(x, y)) {
      x = x - xdelta;
      y = y - ydelta;
    }
  }
  
  boolean isPlayerOfScreen(float x, float y) {
    if (x<0 || x > width - 30 || y < 0 || y > height - 56)
      return true;
    return false;
  }
  
}