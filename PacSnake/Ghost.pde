public abstract class Ghost{

  private Position _pos;
  private String type;
  private boolean alive;
  public boolean isVulnerable;
  private int secondsLeft;
  private boolean scatterMode; 
  private Square[][] map;
  private int speed;
  private Position sTarget;

  public boolean isAlive() {
    return alive;
  }
  public void alive(){
    alive = true;
  } 
  
  public Position getPos() {
    return _pos;
  }

  public String getType(){
    return type;
  }
  
  public int getTime(){
    return secondsLeft;
  }
  public void reduceTime(){
    secondsLeft-=1;
  }
  public void setPos(Position pos) {
      _pos = pos;
  }

  
  public void kill() {
    alive = false;
    secondsLeft = 200;
  }
  
  public void move(PacThing pac, Ghost g){
    if (!isAlive()){
      reduceTime();
      return;
    }
    nextMove(pac);
  }

  public boolean isVul() {
    return isVulnerable;
  }

  public void setVul() {
    isVulnerable = true;
  }

  public void notVul() {
    isVulnerable = false;
  }
  
  public abstract void nextMove(PacThing pac);

  public String toString(){
    return type;
  }
  
}