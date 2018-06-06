import java.util.*;

private int livesLeft;
private int pointsEarned;
private Board board;
private Scores scoreboard;
private Ghost[] ghosts;
private PacThing main;

public void setup() {
  size(560, 720);
  background(color(0, 0, 0));
  board = new Board("default.txt");
  main = new PacThing(board.getStart(), board);
  livesLeft = 5;
  pointsEarned = 0;
  scoreboard = new Scores();
  ghosts = new Ghost[4];
  ghosts[0] = (Ghost) new Blinky(board.getRandomGhostSpawn(), "BLINKY");
  ghosts[1] = (Ghost) new Clyde(board.getRandomGhostSpawn(), "CLYDE"); 
  ghosts[2] = (Ghost) new Inky(board.getRandomGhostSpawn(), "INKY"); 
  ghosts[3] = (Ghost) new Pinky(board.getRandomGhostSpawn(), "PINKY");
}

public void draw() {
  background(color(0, 0, 0));
  //drawPMan();
  //drawGhosts();
  drawBoard();
  print("Finished");
}

public void insertImage(String end, float yLoc, float xLoc, int ySize, int xSize) {
  image(loadImage(sketchPath() + "/sprites/" + end), yLoc, xLoc, ySize, xSize);
}

public void drawPMan() {
  Position p = main.getPos();
  
  insertImage("PMAN.png", p.getXcor()*20, p.getYcor()*20, 20, 20);
}

public void drawGhosts() {
  for (Ghost g : ghosts) {
    Position p = g.getPos();
    float x_ratio = (float)p.getXcor()/board.getXSize();
    float y_ratio = (float)p.getYcor()/board.getYSize();
    float x = x_ratio * height;
    float y = y_ratio * width;
    insertImage(g.getType() + ".png", y, x, width/40, height/40);
  }
}

public void drawBoard() {
  Square[][] mapy = board.getMap();
  for (int r = 0; r < mapy.length; r++) {
    for (int c = 0; c < mapy[0].length; c++) {
      int content = mapy[r][c].getContent();
      println(content);
      if (content == 0) {
        drawWall(r, c);
      }// else if (content == 2) {
      //  drawPelletS(r, c);
      //} else if (content == 6) {
      //  drawFruit(r, c);
      //} else if (content == 7) {
      //  drawPelletB(r, c);
      //}
    }
  }
}


public void drawWall(int xc, int yc) {
  insertImage("WALL.png", yc * 20, xc * 20, 20, 20);
}

public void drawPelletS(int x_c, int y_c) {
  float x_ratio = (float)x_c/board.getXSize();
  float y_ratio = (float)y_c/board.getYSize();
  float x = x_ratio * height;
  float y = y_ratio * width;
  insertImage("PELLET.png", y, x, width/60, height/60);
}

public void drawPelletB(int x_c, int y_c) {
  float x_ratio = (float)x_c/board.getXSize();
  float y_ratio = (float)y_c/board.getYSize();
  float x = x_ratio * height;
  float y = y_ratio * width;
  insertImage("PELLET.png", y, x, width/50, height/50);
}

public void drawFruit(int x_c, int y_c) {
  float x_ratio = (float)x_c/board.getXSize();
  float y_ratio = (float)y_c/board.getYSize();
  float x = x_ratio * height;
  float y = y_ratio * width;
  insertImage("FRUIT.png", y, x, width/50, height/50);
}


public void keyPressed() {
  switch(keyCode) {
  case UP:
    main.changeDirection(1);
    break;
  case DOWN:
    main.changeDirection(-1);
    break;
  case LEFT:
    main.changeDirection(-2);    
    break;
  case RIGHT:
    main.changeDirection(2);
    break;
  }
}  
