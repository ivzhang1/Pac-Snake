public class Ghost{

  private Position _pos;
  private boolean alive;
  private boolean isVulnerable;
  
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
  }
  
  public void notVul(){
    isVulnerable = false;
  }
  
  public void nextMove(){
  }
}
