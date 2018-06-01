import java.util.*;
import java.io.*;
import java.io.FileNotFoundException;

public class Board{

  private Square[][] map;
  private HashMap<Integer, Integer> values;
  
  private int startX, startY;
  private int size;
  
  public Board(String fileName){
  Scanner mazeF = null;
  try{
     mazeF = new Scanner(new File(fileName));
  } catch(FileNotFoundException e){
    print("enter a valid file |" + fileName);
    exit();
  }
  while(mazeF.hasNext()){
     String line = mazeF.next();
     print(line);
     char[] mazeL = line.toCharArray();
     print(Arrays.toString(mazeL));
   }
   
  }

}