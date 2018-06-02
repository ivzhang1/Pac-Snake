public class Ghost {
  private color _color;
  private Position _pos;
  private String type;
  private boolean alive;
  private boolean isVulnerable;

  public Ghost(color _c, Position _p, String ty) {
    _color = _c;
    _pos = _p;
    alive = true;
    type = ty;
  }

  public boolean isAlive() {
    return alive;
  }

  public Position getPos() {
    return _pos;
  }

  public String getType(){
    return type;
  }
  
  public void kill() {
    alive = false;
  }

  public void move() {
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

  public void nextMove() {
  }
}
