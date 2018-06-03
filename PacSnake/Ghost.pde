public class Ghost{

  private Position _pos;
  private boolean alive;
  private boolean isVulnerable;
  private int secondsLeft;
  
  public boolean isAlive(){
    return alive;
  }
   
  public void kill(){
    alive = false;
    secondsLeft = 1000;
  }
  
  public void move(Position pacPos){
    if (!alive){
      secondsLeft -= 1;
      return;
    }
    nextMove(pacPos);
  }
  
  public boolean isVul(){
    return isVulnerable;
  }
  
  public void setVul(){
    isVulnerable = true;
    secondsLeft = 10;
  }
  
  public void setNotVul(){
    isVulnerable = false;
  }
  
  public void nextMove(Position pacPos){
  }
}
