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
  
  
  
  public movable(){
    
  }
  
}
