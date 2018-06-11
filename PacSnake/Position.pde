public class Position implements Comparable<Position>{

  private int xcor;
  private int ycor;
  private Position prev;
  private double dist;
  private double d_prev;

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
  public Position(int x, int y, Position p, double d, double d_p) {
    xcor = x;
    ycor = y;
    prev = p;
    dist = d;
    d_prev = d_p;
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
  
  public double dSoFar(){
    return d_prev;
  }
  
  public Position get_prev(){
    return prev;
  }

  public boolean equals(Position lod){
    return getXcor() == lod.getXcor() && getYcor() == lod.getYcor(); 
  }

  public int compareTo(Position lod) {
    int res = 0;
    double totalD = get_dist()+dSoFar();
    double totald = lod.get_dist()+lod.dSoFar();
    if (totalD > totald) {
      res = 1;
    } else if (totalD < totald) {
      res = -1;
    }
    return res;
  }
}