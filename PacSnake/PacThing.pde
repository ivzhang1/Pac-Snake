public class PacThing {
  private Position pos;
  private boolean eatyMode;
  private int streak;
  private int streakTimeLeft;
  private int direction; // 1 is North, -1 is South, 2 is East, -2 is West
  private Score score;
  private int speed;
  
  private Square[][] map;

  public PacThing(Position start, Board b, int s, Score score) {
    pos = start;
    map = b.getMap();
    direction = 1;
    speed = 10;
  }

  public int getDirection() {
    return direction;
  }

  public Position getPos() {
    return pos;
  }

  public int getSpeed() {
    return speed;
  }

  public void setSpeed(int s) {
    speed = s;
  }

  public void move() {
    if (speed < 0 || speed > 10) {
      println("enter a speed from 0 to 10");
    } else if (frameCount % (21 + -1*speed) == 0) {
      //println(frameCount);
      if (direction == 2) {
        if (map[pos.getXcor()][pos.getYcor()+1].movable()) {
          pos.setYcor(pos.getYcor()+1);
        }
      } else if (direction == -2) {
        if (map[pos.getXcor()][pos.getYcor()-1].movable()) {
          pos.setYcor(pos.getYcor()-1);
        }
      } else if (direction == 1) {
        if (map[pos.getXcor()-1][pos.getYcor()].movable()) {

          pos.setXcor(pos.getXcor()-1);
        }
      } else if (direction == -1) {
        if (map[pos.getXcor()+1][pos.getYcor()].movable()) {
          pos.setXcor(pos.getXcor()+1);
        }
      }
      detect();
    }
  }

  public void changeDirection(int dir) {
    direction = dir;
  }

  public void detect() {
    Square s = map[pos.getXcor()][pos.getYcor()];
    int content = s.getContent();
    int addend = 0;
    if (content == 2) {
      addend = 100; //Score for a small pellet
    } else if (content == 6) {
      addend = 500; //Score for fruit
    } else if (content == 7) {
      addend = 200; //Score for big pellet
    }
    score += addend;
    s.setEmpty();
  }
 
}
