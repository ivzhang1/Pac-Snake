import java.util.*;
import java.io.*;
import java.io.FileNotFoundException;

public class Board {

  private Square[][] map;
  private HashMap<Integer, Integer> values;

  private int startX, startY;
  private int xSize;
  private int ySize;
  
  public Board(String fileName) {
    Scanner mazeF = null;
    xSize = 56;
    ySize = 16;
    map = new Square[xSize][ySize];
    try {
      File f = new File(sketchPath(), fileName);
      mazeF = new Scanner(f);
      int count = 0;
      while (mazeF.hasNext()) {
        String line = mazeF.next();
        char[] mazeL = line.toCharArray();
        //print(Arrays.toString(mazeL));
        int oCount = 0;
        for(char x: mazeL){
           map[count][oCount] = new Square();
        }
      }
    } 
    catch(FileNotFoundException e) {
      print("enter a valid file | " + fileName);
      exit();
    }
  }
}