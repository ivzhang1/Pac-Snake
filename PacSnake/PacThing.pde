public class PacThing {
  private Position pos;
  private boolean eatyMode;
  private int streak;
  private int streakTimeLeft;
  private int direction; // 1 is North, -1 is South, 2 is East, -2 is West

  public PacThing(int x, int y) {
    pos = new Position(x,y);
  }

  public void move() {
  }

  public void changeDirection(int dir) {
    direction = dir;
  }
  
  public void detect() {
  }
}
