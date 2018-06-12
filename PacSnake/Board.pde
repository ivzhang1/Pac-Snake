import java.util.*;
import java.io.*;
import java.io.FileNotFoundException;

public class Board {

  private Square[][] map;
  private HashMap<Integer, Integer> values;
  private int xSize;
  private int ySize;  
  private Position start;
  private ArrayList<Position> ghostSpawns;
  private int size;
  private ArrayList<Position> ghostExit;

  public Board(String fileName) {    
    Scanner mazeF = null;     
    xSize = 36;     
    ySize = 28;     
    map = new Square[xSize][ySize];
    ghostSpawns = new ArrayList<Position>();
    ghostExit = new ArrayList<Position>();
    try {       
      File f = new File(sketchPath(), fileName);       
      mazeF = new Scanner(f);
    }      
    catch(FileNotFoundException e) {       
      print("enter a valid file | " + fileName);       
      exit();
    }      
    int column = 0;
    while (mazeF.hasNext()) { 
      int row = 0;
      String line = mazeF.next(); 
      String[] mazeL = line.split("");   
      for (String x : mazeL) {   
        int value = Integer.parseInt(x);
        if (value == 7) {
          ghostSpawns.add(new Position(column, row));
          //println("ghostspawn: " + ghostSpawns.size());
        } else if (value == 6) {
          start = new Position(column, row);
        } else if (value == 3) {
          ghostExit.add(new Position(column, row));
          //println("ghostexit: " + ghostExit.size());
        }
        map[column][row] = new Square(value);
        row += 1;
      }       
      column += 1;
    }
  }

  public Position getStart() {
    return start;
  }

  public int getXSize() {
    return xSize;
  }

  public int getYSize() {
    return ySize;
  }

  public Square[][] getMap() {
    return map;
  }

  public Position getRandomGhostSpawn() {
    Random ran = new Random();
    int x = ran.nextInt(ghostSpawns.size());
    while (isOccupied(ghostSpawns.get(x))) {
      x = ran.nextInt(ghostSpawns.size());
    }
    setOccupied(ghostSpawns.get(x));
    return ghostSpawns.get(x);
  }

  public Position getRandomGhostExit() {
    Random ran = new Random();
    int x = ran.nextInt(ghostExit.size());
    Position p = new Position(ghostExit.get(x).getXcor()-1, ghostExit.get(x).getYcor());
    return p;
  }  

  public int getValue(int x, int y) {
    return map[x][y].getContent();
  }

  public void setOccupied(Position pos) {
    (map[pos.getYcor()][pos.getXcor()]).setOccupied();
  }

  public Boolean isOccupied(Position pos) {
     try{
    return map[pos.getYcor()][pos.getXcor()].occupied();
     }catch(ArrayIndexOutOfBoundsException e){
       return true;
     }
  }
  


}