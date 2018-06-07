public class Position {

  private int xcor;
  private int ycor;
  private double dist;

  public Position() {
    xcor = 0;
    ycor = 0;
  }

  public Position(int x, int y) {
    xcor = x;
    ycor = y;
  }

  public Position(int x, int y, double d) {
    xcor = x;
    ycor = y;
    dist = d;
  }  

  public int getXcor() {
    return xcor;
  }

  public int getYcor() {
    return ycor;
  }

  public void setXcor(int x) {
    xcor = x;
  }

  public void setYcor(int y) {
    ycor = y;
  }

  public String toString() {
    return (ycor + "," + xcor);
  }

  public double get_dist(){
    return dist;
  }

  public int compareTo(Position lod) {
    int res = 0;
    double totalD = get_dist();
    double totald = lod.get_dist();
    if (totalD > totald) {
      res = 1;
    } else if (totalD < totald) {
      res = -1;
    }
    return res;
  }
}