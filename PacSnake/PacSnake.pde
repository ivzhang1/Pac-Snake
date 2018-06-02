private int livesLeft;
private int pointsEarned;
private Board board;
private Score scoreboard;
private Ghost[] ghosts;
private PacThing main;

//pushMatrix(), popMatrix()
public void setup() {
  size(600, 600);
  background(color(0, 0, 0));
  board = new Board("default.txt");
  //print(b.getValue(b.getStartX(),b.getStartY()));
  main = new PacThing(board.getStart());
  livesLeft = 5;
  pointsEarned = 0;
  scoreboard = new Score();
  ghosts = new Ghost[4];
  ghosts[0] = new Ghost(color(255, 12, 19), board.getRandomGhostSpawn(), "BLINKY"); //BLINKY
  ghosts[1] = new Ghost(color(242, 174, 175), board.getRandomGhostSpawn(), "PINKY"); //PINKY
  ghosts[2] = new Ghost(color(27, 177, 230), board.getRandomGhostSpawn(), "INKY"); //INKY
  ghosts[3] = new Ghost(color(246, 126, 22), board.getRandomGhostSpawn(), "CLYDE"); //CLYDE
}

public void drawBoard(Board board) {
  Square[][] mapy = board.getMap();
  for (int r = 0; r < mapy.length; r++) {
    for (int c = 0; c < mapy[0].length; c++) {
      int content = mapy[r][c].getContent();
      switch(content)
      {
      case 0:
        drawWall(r,c);
      case 2:
        drawPelletS(r,c);
      case 6:
        drawFruit(r,c);
      case 7:
        drawPelletB(r,c);
      }
    }
  }
}

public PImage drawWall(int x, int y) {
  return null;
}
public PImage drawPelletS(int x, int y) {
  return null;
}
public PImage drawPelletB(int x, int y) {
  return null;
}
public PImage drawFruit(int x, int y) {
  return null;
}
public PImage drawPMan() {
  return null;
}
public PImage drawGhosts() {
  return null;
}





public void draw() {
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
