import java.util.PriorityQueue;

public class Blinky extends Ghost {
  private MyHeap<Position> frontier = new MyHeap<Position>(false);
  private MyHeap<Position> farthest = new MyHeap<Position>(true);

  private Board board;

  private Position _pos;
  private String type;
  private boolean alive;
  public boolean isVulnerable;
  private int secondsLeft;
  private boolean scatterMode; 
  private Square[][] map;
  private int speed;
  private Position sTarget;
  private int scatterTimer;

  public Blinky(Position pos, String type, Board b) {
    _pos = pos;
    this.alive = false;
    isVulnerable = false;
    secondsLeft = 20;
    this.type = type;
    board = b;
    map = board.getMap();
    speed = 9;
    scatterMode = true;
    sTarget = new Position(5, 23);
    scatterTimer = 0;
  }
  public boolean isAlive() {
    return alive;
  }
  public void kill() {
    alive = false;
    secondsLeft = 200;
  }
  public Position getPos() {
    return _pos;
  }

  public void alive() {
    alive = true;
  }

  public void notVul() {
    isVulnerable = !isVulnerable;
  }
  public String getType() {
    return type;
  }
  public int getSpeed() {
    return speed;
  }

  public int getTime() {
    return secondsLeft;
  }
  public void reduceTime() {
    secondsLeft-=1;
  }
  public void setPos(Position pos) {
    _pos = pos;
  }

  public void setSpeed(int s) {
    speed = s;
  }

  public void checkScatter() {
    if (scatterTimer == 0) {
      scatterTimer++;
      return;
    }
    if (scatterTimer % 503 == 0) {
      scatterMode = false;
    } else if (scatterTimer % 701 == 0) {
      scatterMode = true;
    }
    scatterTimer++;
  }
  public double distance(int x, int y, Position b) {
    double dist = 0.0;
    int dx = Math.abs(x - b.getXcor());
    int dy = Math.abs(y - b.getYcor());
    return Math.sqrt(dx*dx + dy*dy);
  }  
  public void nextMove(PacThing pac) {
    if (isVulnerable) {
      farthest = new MyHeap<Position>(true);
      if (speed < 0 || speed > 10) {
        println("enter a speed from 0 to 10");
      } else if (frameCount % (21 + -1*speed) == 0) {
        int x = _pos.getXcor();
        int y = _pos.getYcor();

        Position[] positions = {new Position(x+1, y, distance(x+1, y, pac.getPos()) ), 
          new Position(x-1, y, distance(x-1, y, pac.getPos())), 
          new Position(x, y+1, distance(x, y+1, pac.getPos())), 
          new Position(x, y-1, distance(x, y-1, pac.getPos()))};
        for (Position p : positions) {
          if (map[p.getXcor()][p.getYcor()].movable()) {
            //println(p + " " + p.get_dist());
            //println("STOP");            println("STOP");
            //            println("STOP");
            farthest.add(p);
          }
        }
        Position px = farthest.remove();
        //println(px.get_dist());
        Position next = solve(px);
        _pos = next;
      }
      return;
    }

    checkScatter();
    if (!isVulnerable && scatterMode) {
      if (speed < 0 || speed > 10) {
        println("enter a speed from 0 to 10");
      } else if (frameCount % (21 + -1*speed) == 0) {
        if (sTarget.equals(_pos)) {
          Position one = new Position(5, 23);
          Position two = new Position(9, 23);
          Position three = new Position(7, 26);
          if (sTarget.equals(one)) {
            sTarget = two;
          } else if (sTarget.equals(two)) {
            sTarget = three;
          } else if (sTarget.equals(three)) {
            sTarget = one;
          }
        }
        Position next = solve(sTarget);
        _pos = next;
        //println(_pos);
      }
      return;
    }
    Position pacPos = pac.getPos();
    if (speed < 0 || speed > 10) {
      println("enter a speed from 0 to 10");
    } else if (frameCount % (21 + -1*speed) == 0 && !isVulnerable) {
      Position next = solve(pacPos);
      _pos = next;
    }
  }

  public void meander(Position pacPos) {
    int[][] delta = {{_pos.getXcor()+1, _pos.getYcor()}, 
      {_pos.getXcor()-1, _pos.getYcor()}, 
      {_pos.getXcor(), _pos.getYcor()+1}, 
      {_pos.getXcor(), _pos.getYcor()-1}};
    int index = (int)(Math.random() * 4);
    int[] nextPos = delta[index];
    if (map[nextPos[0]][nextPos[1]].movable() && map[nextPos[0]][nextPos[1]].getContent() != 3) {
      _pos.setXcor(nextPos[0]);
      _pos.setYcor(nextPos[1]);
    }
  }

  public String toString() {
    return type;
  }



  public Position[] getNeighbors(Position L, Position pman) {
    Position[] loci = new Position[4];
    int count = 0;
    if (L.getXcor() >= map.length || L.getYcor() >= map[0].length) {
      return null;
    }

    int px = pman.getXcor();  
    int py = pman.getYcor();  

    int[][] coors = {{L.getXcor() + 1, L.getYcor()}, 
      {L.getXcor() - 1, L.getYcor()}, 
      {L.getXcor(), L.getYcor() + 1}, 
      {L.getXcor(), L.getYcor() - 1}};
    for (int coor[] : coors) {
      if (coor[0] >= 0 && coor[0] < map.length &&
        coor[1] >= 0 && coor[1] < map[0].length) {

        if (map[coor[0]][coor[1]].getContent() != 0 || map[coor[0]][coor[1]].getContent() != 8 || map[coor[0]][coor[1]].getContent() != 3) {
          double dist = Math.abs((px-coor[0]-1)) + Math.abs((py-coor[1]+1));
          loci[count] = new Position(coor[0], coor[1], L, dist, 1+L.dSoFar());
        }
        count++;
      }
    }
    return loci;
  }

  public Position solve(Position pman) {

    frontier = new MyHeap<Position>(false);
    frontier.add(_pos);
    Position end = pman;
    int threshold = 0;
    while (frontier.size() != 0) {
      if(threshold > 1000){
        return _pos;
      }
      Position prev = frontier.remove();
      Position[] nextL = getNeighbors(prev, pman);
      for (Position l : nextL) {
        if (l != null) {
          int inty = map[l.getXcor()][l.getYcor()].getContent();
          //println(inty);
          end = new Position(l.getXcor(), l.getYcor(), prev, 0, 0);
          if (l.equals(pman)) {

            while (end.get_prev() != null && !end.get_prev().equals(_pos)) {
              end = end.get_prev();
            }
            return end;
          }

          if (inty != 0) {
            frontier.add(l);
          }
        }
      }
      threshold++;
    }

    return null;
  }


  public void getAStar(Position pman) {
    solve(pman);
    //print(frontier.size());
  }
}