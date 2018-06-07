public abstract class Ghost{

  private Position _pos;
  private String type;
  private boolean alive;
  private boolean isVulnerable;
  private int secondsLeft;

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
    secondsLeft = 1000;
  }
  
  public void move(Position pacPos){
    if (!isAlive()){
      reduceTime();
      return;
    }
    nextMove(pacPos);
  }

  public boolean isVul() {
    return isVulnerable;
  }

  public void setVul() {
    isVulnerable = true;
    secondsLeft = 100;
  }

  public void notVul() {
    isVulnerable = false;
  }
  
  public abstract void nextMove(Position pacPos);
  
  public String toString(){
    return type;
  }
  
}