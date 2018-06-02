private int livesLeft;
private int pointsEarned;
private Board board;
private Score scoreboard;
private Ghost[] ghosts;
private PacThing main;

//pushMatrix(), popMatrix()
public void setup(){
  Board b = new Board("default.txt");
  //print(b.getValue(b.getStartX(),b.getStartY()));
  PacThing pac = new PacThing(b.getStartX(),b.getStartY());
}

public void draw(){
}

public void keyPressed(){
  if(keyCode == UP){
    
  }
  else if(keyCode == DOWN){
  }
  else if(keyCode == LEFT){
  }
  else if(keyCode == RIGHT){
  }
}
