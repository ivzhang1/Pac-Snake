public class Square{
  
  private int contents;
  private final Boolean isBlock;
  public Boolean isOccupied; 
  
  public Square(int material){
    if (material == 0){
      contents = 0;
      isBlock = true; 
    }else{
      contents = material;
      isBlock = false; 
    }
    isOccupied = false;//!(material == 1);
  }
  
  public Boolean occupied(){
    return isOccupied;
  }
  
  public void setOccupied(){
     isOccupied = true;
  }
  
  public void setUnoccupied(){
     isOccupied = false;
  }
  
  public Boolean movable(){
    return !isBlock && !occupied() && contents != 8 && contents != 3; 
  }
  
  public int getContent(){
    return contents;
  }
  
  public void setEmpty(){
    if (isBlock){
      throw new IllegalArgumentException(); //<>//
    }
    contents = 1;
  }
  
  public String toString(){
    return "" + contents;
  }
}