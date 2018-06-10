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
  private Ghost b;

  public Inky(Position pos, String type, Square[][] m, Ghost _b) {
    _pos = pos;
    this.alive = false;
    isVulnerable = false;
    secondsLeft = 2;
    this.type = type;
    map = m;
    speed = 10;
    b = _b;
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
    try{
      if (map[x][y].getContent() == 1 || map[x][y].getContent() == 2) {
        return true;
      }
    }catch(ArrayIndexOutOfBoundsException a){
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
    Position pacPos = pac.getPos();

    Position blinkPos = b.getPos();

    int xDiff = (pacPos.getXcor()-blinkPos.getXcor()) * 2; //if + then blink is below PacMan
    int yDiff = (pacPos.getYcor()-blinkPos.getYcor()) * 2; //if + then blink is left PacMan

    int x = _pos.getXcor() + Math.abs(xDiff);
    int y = _pos.getYcor() + Math.abs(yDiff);
    //println(" " + xDiff + ", " + yDiff);
    int[] cpos = null; 
    if (speed < 0 || speed > 10) {
      println("enter a speed from 0 to 10");
    } else if (frameCount % (21 + -1*speed) == 0) {
      while (!checkCases(x, y)) {
        //println(x + " " + y);
        int[][] ppos = {{x+1, y}, {x-1, y}, {x, y+1}, {x, y -1}, 
          {x+1, y+1}, {x+1, y-1}, {x-1, y+1}, {x-1, y-1}};
        cpos = correctPos(ppos);
        //println(x + " " + y);
        if (cpos == null) {
          x-=1;
          y-=1;
        } else {
          break;
        }
        if (x < 2) {
          x++;
        } else if (x > map.length - 2) {
          x--;
        }
        if (y < 0) {
          y++;
        } else if (y > map[0].length) {
          y--;
        }
      }

      //print("fd");
      Position p = new Position(pacPos.getXcor(), pacPos.getYcor());
      if (cpos != null) {
        p = new Position(cpos[0], cpos[1]);
      }
      //println(p.getXcor() + ", " + p.getYcor()); 
      Position next = solve(p);
      //meander(pacPos);
      _pos = next;
    }
  }


  public void meander() {
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

        if (map[coor[0]][coor[1]].getContent() != 0 || map[coor[0]][coor[1]].getContent() != 8) {
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