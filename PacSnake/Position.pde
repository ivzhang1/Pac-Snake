public class Position{
  
  private int xcor;
  private int ycor;
  
  public Position(){
    xcor = 0;
    ycor = 0;
  }
  
  public Position(int x, int y){
    xcor = x;
    ycor = y;
  }
  
  public int getXcor(){
    return xcor;
  }
  
  public int getYcor(){
    return ycor;
  }

  public void setXcor(int x){
    xcor = x;
  }
  
  public void setYcor(int y){
    ycor = y;
  }
  
  public void printPos(){
    print(xcor + "," + ycor);
  }
}
