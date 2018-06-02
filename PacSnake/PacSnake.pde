private int livesLeft;
private int pointsEarned;
private Board board;
private Score scoreboard;
private Ghost[] ghosts;
private PacThing main;

//pushMatrix(), popMatrix()
public void setup(){
  board = new Board("default.txt");
  //print(b.getValue(b.getStartX(),b.getStartY()));
  main = new PacThing(board.getStart());
  livesLeft = 5;
  pointsEarned = 0;
  scoreboard = new Score();
  ghosts = new Ghost[4];
  ghosts[0] = new Ghost(color(255,12,19), board.getRandomGhostSpawn(), "BLINKY"); //BLINKY
  ghosts[1] = new Ghost(color(242, 174, 175), board.getRandomGhostSpawn(), "PINKY"); //PINKY
  ghosts[2] = new Ghost(color(27,177,230), board.getRandomGhostSpawn(), "INKY"); //INKY
  ghosts[3] = new Ghost(color(246, 126, 22), board.getRandomGhostSpawn(), "CLYDE"); //CLYDE
}

public void draw(){
}

public void keyPressed(){
  if(keyCode == UP){
     main.changeDirection(1);
  }
  else if(keyCode == DOWN){
     main.changeDirection(-1);
  }
  else if(keyCode == LEFT){
     main.changeDirection(-2);
  }
  else if(keyCode == RIGHT){
     main.changeDirection(2);
  }
}
