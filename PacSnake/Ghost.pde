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
  }
  
  public void move(){
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
  
  public void nextMove(){
  }
}
