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
  drawPMan();
  drawGhosts();
  drawBoard();
}

public void draw() {
  findOccupied();
}

public void findOccupied(){
  String gath = "";
  Square[][] mapy = board.getMap();
  for (int r = 0; r < mapy.length; r++) {
    for (int c = 0; c < mapy[0].length; c++) {
      if (mapy[r][c].occupied()){
        gath += r + " " + c + "    ";
      }
    }
  }
  println(gath);
}

public void insertImage(String end, float yLoc, float xLoc, int ySize, int xSize) {
  image(loadImage(sketchPath() + "/sprites/" + end), yLoc, xLoc, ySize, xSize);
}

public void drawPMan() {
  Position p = main.getPos();
  insertImage("2PMAN.png", p.getYcor()*20, p.getXcor()*20, 20, 20);
}

public void drawGhosts() {
  for (Ghost g : ghosts) {
    Position p = g.getPos();
    insertImage(g.getType() + ".png", p.getYcor()*20, p.getXcor()*20, 20, 20);
  }
}

public void drawBoard() {
  Square[][] mapy = board.getMap();
  for (int r = 0; r < mapy.length; r++) {
    for (int c = 0; c < mapy[0].length; c++) {
      int content = mapy[r][c].getContent();
      if (content == 0) {
        drawWall(r, c);
      } else if (content == 2) {
        drawPelletS(r, c);
      } else if (content == 3) {
        drawGWall(r, c);
      } else if (content == 5) {
        drawPelletB(r, c);
      } //else if (content == 7) {
      //  drawPelletB(r, c);
      //}
    }
  }
}


public void drawWall(int xc, int yc) {
  insertImage("BWALL.png", yc * 20, xc * 20, 20, 20);
}

public void drawGWall(int xc, int yc) {
  insertImage("PWALL.png", yc * 20, xc * 20, 19, 19);
}

public void drawPelletS(int xc, int yc) {
  insertImage("PELLET.png", yc * 20 + 8, xc * 20 + 8, 5, 5);
}

public void drawPelletB(int xc, int yc) {
  insertImage("PELLET.png", yc* 20 + 2, xc* 20 + 2, 15, 15);
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
    println("up");
    break;
  case DOWN:
    main.changeDirection(-1);
    println("down");
    break;
  case LEFT:
    main.changeDirection(-2); 
    println("left");
    break;
  case RIGHT:
    main.changeDirection(2);
    println("right");
    break;
  }
}  
