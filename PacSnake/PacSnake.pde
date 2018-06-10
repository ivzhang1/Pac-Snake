import java.util.*;

private int livesLeft;
private int pointsEarned;
private Board board;
private Scores scoreboard;
private Ghost[] ghosts;
private PacThing main;

private boolean isGameStarted;

private PImage pman;
private PImage blinky;
private PImage clyde;
private PImage inky;
private PImage pinky;
private PImage fruit;
private PImage pellet;
private PImage black;
private PImage wall;
private PImage pwall;


public void setup() {
  size(560, 720);
  background(color(0, 0, 0));
  board = new Board("default.txt");
  main = new PacThing(board.getStart(), board, 1);
  livesLeft = 5;
  pointsEarned = 0;
  scoreboard = new Scores();
  ghosts = new Ghost[4];
  ghosts[0] = (Ghost) new Blinky(board.getRandomGhostSpawn(), "BLINKY", board);
  ghosts[1] = (Ghost) new Clyde(board.getRandomGhostSpawn(), "CLYDE", board); 
  ghosts[2] = (Ghost) new Inky(board.getRandomGhostSpawn(), "INKY", board.getMap(), ghosts[0]); 
  ghosts[3] = (Ghost) new Pinky(board.getRandomGhostSpawn(), "PINKY", board);
  setupPImages();
  drawPMan();
  drawGhosts();
  drawBoard(true);
  textSize(50);
  textAlign(CENTER);
  text("Click to Start", 280, 360);
}

public void setupPImages() {
  String addend = sketchPath() + "/sprites/";
  pman = loadImage(addend + main.getDirection() + "PMAN.png");
  blinky = loadImage(addend + "BLINKY.png");
  clyde = loadImage(addend + "CLYDE.png");
  inky = loadImage(addend + "INKY.png");
  pinky = loadImage(addend + "PINKY.png");
  fruit = loadImage(addend + "FRUIT.png");
  pellet = loadImage(addend + "PELLET.png");
  black = loadImage(addend + "black.png");
  wall = loadImage(addend + "BWALL.png");
  pwall = loadImage(addend + "PWALL.png");
}


public void draw() {
  if (isGameStarted) {
    for (int i = 0; i < 4; i++) {
      if(i == 2){
        continue;
      }
      if (ghosts[i].getTime() == 0 && !ghosts[i].isAlive()) {
        ghosts[i].setPos(board.getRandomGhostExit());
        ghosts[i].alive();
      }
      if(i == 2){
        ghosts[i].move(main, ghosts[0]);
      }
      else{
        ghosts[i].move(main, null);
      }
    }
    main.move();
    drawEverything();
    
  }
}

public void drawEverything() {
  background(color(0, 0, 0));
  drawPMan();
  drawGhosts();
  drawBoard(true);
  //findOccupied();
}

public void findOccupied() {
  String gath = "";
  Square[][] mapy = board.getMap();
  for (int r = 0; r < mapy.length; r++) {
    for (int c = 0; c < mapy[0].length; c++) {
      if (mapy[r][c].occupied()) {
        gath += r + " " + c + "    ";
      }
    }
  }
  println(gath);
}

public void insertImage(PImage img, float yLoc, float xLoc, int ySize, int xSize) {
  image(img, yLoc, xLoc, ySize, xSize);
}


public void drawPMan() {
  Position p = main.getPos();
  insertImage(pman, p.getYcor()*20, p.getXcor()*20, 20, 20);
}

public void drawGhosts() {
  Position p = ghosts[0].getPos();
  insertImage(blinky, p.getYcor()*20, p.getXcor()*20, 20, 20);
  p = ghosts[1].getPos();
  insertImage(clyde, p.getYcor()*20, p.getXcor()*20, 20, 20);
  p = ghosts[2].getPos();
  insertImage(inky, p.getYcor()*20, p.getXcor()*20, 20, 20);
  p = ghosts[3].getPos();
  insertImage(pinky, p.getYcor()*20, p.getXcor()*20, 20, 20);
}

public void drawBoard(boolean isWall) {
  Square[][] mapy = board.getMap();
  for (int r = 0; r < mapy.length; r++) {
    for (int c = 0; c < mapy[0].length; c++) {
      int content = mapy[r][c].getContent();
      if (content == 0 && isWall) {
        drawWall(r, c);
      } else if (content == 2) {
        drawPelletS(r, c);
      } else if (content == 3) {
        drawGWall(r, c);
      } else if (content == 5) {
        drawPelletB(r, c);
      } else if (content == 4) {
        drawFruit(r, c);
      }
    }
  }
}


public void drawWall(int xc, int yc) {
  insertImage(wall, yc * 20, xc * 20, 20, 20);
}

public void drawGWall(int xc, int yc) {
  insertImage(pwall, yc * 20, xc * 20, 19, 19);
}

public void drawPelletS(int xc, int yc) {
  insertImage(pellet, yc * 20 + 8, xc * 20 + 8, 5, 5);
}

public void drawPelletB(int xc, int yc) {
  insertImage(pellet, yc* 20 + 2, xc* 20 + 2, 15, 15);
}

public void drawFruit(int xc, int yc) {
  insertImage(fruit, yc* 20 + 2, xc* 20 + 2, 15, 15);
}

public void mouseClicked() {
  if (!isGameStarted) {
    isGameStarted = true;
  }
}

public void keyPressed() {
  switch(keyCode) {
  case UP:
    main.changeDirection(1);
    //println("up");
    break;
  case DOWN:
    main.changeDirection(-1);
    //println("down");
    break;
  case LEFT:
    main.changeDirection(-2); 
    //println("left");
    break;
  case RIGHT:
    main.changeDirection(2);
    //println("right");
    break;
  }
  String addend = sketchPath() + "/sprites/";
  pman = loadImage(addend + main.getDirection() + "PMAN.png");
}  