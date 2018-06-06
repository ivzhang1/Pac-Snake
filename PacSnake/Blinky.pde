public class Blinky extends Ghost{
  
  private Position _pos;
  private String type;
  private boolean alive;
  private boolean isVulnerable;
  private int secondsLeft;
  
  public Blinky(Position pos, String type){
    _pos = pos;
    alive = true;
    isVulnerable = false;
    secondsLeft = 0;
    this.type = type;
  }
  
  public Position getPos() {
    return _pos;
  }
  
  public String getType(){
    return type;
  }
  
  public void nextMove(Position pacPos){
  
  }

  public String toString(){
    return type;
  }
  
}