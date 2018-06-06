public class Blinky extends Ghost {

  private Position _pos;
  private String type;
  private boolean alive;
  private boolean isVulnerable;
  private int secondsLeft;
  private Square[][] map;
  private int speed;

  public Blinky(Position pos, String type, Square[][] m) {
    _pos = pos;
    alive = true;
    isVulnerable = false;
    secondsLeft = 0;
    this.type = type;
    map = m;
    speed = 1;
  }

  public Position getPos() {
    return _pos;
  }

  public String getType() {
    return type;
  }
  public int getSpeed() {
    return speed;
  }

  public void setSpeed(int s) {
    speed = s;
  }

  public void nextMove(Position pacPos) {
    meander(pacPos);
  }

  public void meander(Position pacPos) {
    int[][] delta = {{pacPos.getXcor()+speed, pacPos.getYcor()}, 
      {pacPos.getXcor()-speed, pacPos.getYcor()}, 
      {pacPos.getXcor(), pacPos.getYcor()+speed}, 
      {pacPos.getXcor(), pacPos.getYcor()-speed}};
    int index = (int)(Math.random() * 4);
    int[] nextPos = delta[index];
    if (map[nextPos[0]][nextPos[1]].movable() && map[nextPos[0]][nextPos[1]].getContent() != 3) {
      pacPos.setXcor(nextPos[0]);
      pacPos.setYcor(nextPos[1]);
    }
  }

  public String toString() {
    return type;
  }
}