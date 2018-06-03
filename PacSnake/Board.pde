import java.util.*;
import java.io.*;
import java.io.FileNotFoundException;

public class Board {

  private Square[][] map;
  private HashMap<Integer, Integer> values;
  private int xSize;
  private int ySize;  
  private Position start;
  private Position[] ghostSpawns;
  private int size;

  public Board(String fileName) {    
    Scanner mazeF = null;     
    xSize = 17;     
    ySize = 58;     
    map = new Square[xSize][ySize];
    ghostSpawns = new Position[24];
    int gsCount = 0;
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
        if (x == 56) {
          if (start == null) {
            start = new Position(count, oCount);
          } else {
            print("More than one start");
            throw new IllegalArgumentException();
          }
        }
        if (x == 57) {
          if (gsCount < 24) {
            ghostSpawns[gsCount] = new Position(count, oCount);
            gsCount++;
          }
        }

        map[count][oCount] = new Square(x-48);         
        oCount++;
      }       
      count++;
    }
  }

  public Position getStart() {
    return start;
  }
  
  public int getXSize(){
    return xSize;
  }
 
  public int getYSize(){
    return ySize;
  }
  
  public Square[][] getMap(){
    return map;
  }

  public Position getRandomGhostSpawn() {
    Random ran = new Random();
    int x = ran.nextInt(ghostSpawns.length);
    return ghostSpawns[x];
  }

  public int getValue(int x, int y) {
    return map[x][y].getContent();
  }
}