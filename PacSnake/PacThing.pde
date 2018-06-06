public class PacThing {
  private Position pos;
  private boolean eatyMode;
  private int streak;
  private int streakTimeLeft;
  private int direction; // 1 is North, -1 is South, 2 is East, -2 is West
  private int score;
  private int speed = 1;
  private Square[][] map;
  private String title;

  public PacThing(Position start, Board b) {
    pos = start;
    map = b.getMap();
    title = "1PMAN";
    direction = 1;
  }

  public String getTitle() {
    return title;
  }

  public Position getPos() {
    return pos;
  }

  public void move() {

    if (direction == 2) {
      if (map[pos.getXcor()][pos.getYcor()+speed].movable()) {
        pos.setYcor(pos.getYcor()+speed);
      }
    } else if (direction == -2) {
      if (map[pos.getXcor()][pos.getYcor()-speed].movable()) {
        pos.setYcor(pos.getYcor()-speed);
      }
    } else if (direction == 1) {
      if (map[pos.getXcor()-speed][pos.getYcor()].movable()) {

        pos.setXcor(pos.getXcor()-speed);
      }
    } else if (direction == -1) {
      if (map[pos.getXcor()+speed][pos.getYcor()].movable()) {
        pos.setXcor(pos.getXcor()+speed);
      }
    }
    detect();
  }

  public void changeDirection(int dir) {
    direction = dir;
    title = "" + dir + "PMAN";
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