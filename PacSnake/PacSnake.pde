import java.util.*;

private int livesLeft;
private int pointsEarned;
private Board board;
private Scores scoreboard;
private Ghost[] ghosts;
private PacThing main;

public void setup() {
  size(600, 600);
  background(color(0, 0, 0));
  board = new Board("default.txt");
  //print(b.getValue(b.getStartX(),b.getStartY()));
  main = new PacThing(board.getStart());
  livesLeft = 5;
  pointsEarned = 0;
  scoreboard = new Scores();
  ghosts = new Ghost[4];
  
  ghosts[0] = (Ghost) new Blinky(board.getRandomGhostSpawn(), "BLINKY");
  ghosts[1] = (Ghost) new Clyde(board.getRandomGhostSpawn(), "CLYDE"); 
  ghosts[2] = (Ghost) new Inky(board.getRandomGhostSpawn(), "INKY"); 
  ghosts[3] = (Ghost) new Pinky(board.getRandomGhostSpawn(), "PINKY"); 
  println(Arrays.toString(ghosts));
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
      } else if (content == 6) {
        drawFruit(r, c);
      } else if (content == 7) {
        drawPelletB(r, c);
      }
    }
  }
}

public void drawWall(int x, int y) {
  float x_c = float(x);
  float y_c = float(y);
  image(loadImage(sketchPath() + "/sprites/WALL.png"), x_c, y_c, 2.0f, 2.0f);
}

public void drawPelletS(int x, int y) {
  float x_c = float(x);
  float y_c = float(y);
  image(loadImage(sketchPath() + "/sprites/PELLET.png"), x_c, y_c, 1.0f, 1.0f);
}

public void drawPelletB(int x, int y) {
  float x_c = float(x);
  float y_c = float(y);
  image(loadImage(sketchPath() + "/sprites/PELLET.png"), x_c, y_c, 1.5f, 1.5f);
}

public void drawFruit(int x, int y) {
  float x_c = float(x);
  float y_c = float(y);
  image(loadImage(sketchPath() + "/sprites/FRUIT.png"), x_c, y_c, 1.0f, 1.0f);
}

public void drawPMan() {
  Position p = main.getPos();
  image(loadImage(sketchPath() + "/sprites/PMAN.png"), p.getXcor(), p.getYcor(), width/10, height/10);
}

public void drawGhosts() {
  for (Ghost g : ghosts) {
    Position p = g.getPos();
    println(g);
    println(p + " is the position");
    int x = p.getXcor() * width/10;
    int y = p.getYcor(); //* height/10;
    image(loadImage(sketchPath() + "/sprites/" + g.getType() + ".png"), x, y, width/10, height/10);
  }
}

public void draw() {
  background(color(0, 0, 0));
  pushMatrix();
    float ang = radians(90);
    //rotate(ang);    
    drawPMan();
    drawGhosts();
  popMatrix();
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
