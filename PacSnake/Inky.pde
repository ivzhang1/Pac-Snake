import java.util.PriorityQueue;

public class Inky extends Ghost {
  private MyHeap<Position> frontier = new MyHeap<Position>(false);
  private Board board;

  private Position _pos;
  private String type;
  private boolean alive;
  private boolean isVulnerable;
  private int secondsLeft;
  private Square[][] map;
  private int speed;
  private boolean scatterMode; 
  private Ghost b;
  private Position sTarget;


  public Inky(Position pos, String type, Square[][] m, Ghost _b) {
    _pos = pos;
    this.alive = false;
    isVulnerable = false;
    secondsLeft = 2;
    this.type = type;
    map = m;
    speed = 9;
    b = _b;
    scatterMode = false;
    sTarget = new Position(26, 20);
  }
  public boolean isAlive() {
    return alive;
  }
  public Position getPos() {
    return _pos;
  }

  public void alive() {
    alive = true;
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

  public boolean checkCases(int x, int y) {
    if (x < 2 || x > map.length - 2 || y < 0 || y > map[0].length) {
      return false;
    }
    try {
      if (map[x][y].getContent() == 1 || map[x][y].getContent() == 2) {
        return true;
      }
    }
    catch(ArrayIndexOutOfBoundsException a) {
      return false;
    }
    return false;
  }

  public int[] correctPos(int[][] pos) {
    for (int[] p : pos) {
      if (checkCases(p[0], p[1])) {
        return p;
      }
    }
    return null;
  }

  public void nextMove(PacThing pac) {
    if (scatterMode) {
      if (speed < 0 || speed > 10) {
        println("enter a speed from 0 to 10");
      } else if (frameCount % (21 + -1*speed) == 0) {
        if (sTarget.equals(_pos)) {
          Position one = new Position(5, 3);
          Position two = new Position(9, 3);
          Position three = new Position(7, 6);
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
        return;
      }
    }
    Position pacPos = pac.getPos();
    Position aheadTarget = new Position(pacPos.getXcor(), pacPos.getYcor());
    int direction = pac.getDirection();
    if (direction == 1) {
      aheadTarget.setXcor(aheadTarget.getXcor()-2);
    } else if (direction == -1) {
      aheadTarget.setXcor(aheadTarget.getXcor()+2);
    } else if (direction == 2) {
      aheadTarget.setYcor(aheadTarget.getYcor()+2);
    } else {
      aheadTarget.setYcor(aheadTarget.getYcor()-2);
    }
    if (speed < 0 || speed > 10) {
      println("enter a speed from 0 to 10");
    } else if (frameCount % (21 + -1*speed) == 0) {
      try {
        if (map[aheadTarget.getXcor()][aheadTarget.getYcor()].movable()) {
          _pos = solve(aheadTarget);
        } else {
          _pos = solve(pacPos);
        }
      } 
      catch(IndexOutOfBoundsException e) {
        _pos = solve(pacPos);
      }
    }
  }
  public double distance(Position a, Position b) {
    double dist = 0.0;
    int dx = Math.abs(a.getXcor() - b.getXcor());
    int dy = Math.abs(a.getYcor() - b.getYcor());
    return Math.sqrt(dx*dx + dy*dy);
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
    while (frontier.size() != 0) {
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
    }

    return null;
  }


  public void getAStar(Position pman) {
    solve(pman);
    //print(frontier.size());
  }
}