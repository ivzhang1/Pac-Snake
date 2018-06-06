public class Square{
  
  private int contents;
  private final Boolean isBlock;
  
  public Square(int material){
    if (material == 0){
      contents = 0;
      isBlock = true; 
    }else{
      contents = material;
      isBlock = false; 
    }
  }
  
  public Boolean movable(){
    return !isBlock; 
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