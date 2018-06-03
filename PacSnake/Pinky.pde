public class Pinky extends Ghost{
  
  private Position _pos;
  private String type;
  private boolean alive;
  private boolean isVulnerable;
  private int secondsLeft;
  
  public Pinky(Position pos, String type){
    _pos = pos;
    this.alive = true;
    isVulnerable = false;
    secondsLeft = 0;
    this.type = type;
  }
  
  public void nextMove(Position pacPos){
  
  }

  public Position getPos() {
    return _pos;
  }
  
  public String toString(){
    return type;
  }
  
}
