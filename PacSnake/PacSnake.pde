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
