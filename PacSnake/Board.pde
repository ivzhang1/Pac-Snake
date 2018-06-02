import java.util.*;
import java.io.*;
import java.io.FileNotFoundException;

public class Board {

  private Square[][] map;
  private HashMap<Integer, Integer> values;

  private int startX, startY;
  private int size;

  public Board(String fileName) {    
    Scanner mazeF = null;     
    int xSize = 17;     
    int ySize = 58;     
    map = new Square[xSize][ySize];    
    try {       
      File f = new File(sketchPath(), fileName);       
      mazeF = new Scanner(f);
    }      
    catch(FileNotFoundException e) {       
      print("enter a valid file | " + fileName);       
      exit();
    }      
    int count = 0;     
    while (mazeF.hasNext()) {       
      String line = mazeF.next();       
      char[] mazeL = line.toCharArray();     
      //print(Arrays.toString(mazeL));       
      int oCount = 0;        
      for (char x : mazeL) {         
        //println(count + "" +  oCount);
        if(x-48 == 8){
          startX = count;
          startY = oCount;
        }
        map[count][oCount] = new Square(x-48);         
        oCount++;
      }       
      count++;
    }            
  }
  
  public int getStartX(){
    return startX;
  }
  
  public int getStartY(){
    return startY;
  }
  
  public int getValue(int x, int y){
    return map[x][y].getContent();
  }
}
