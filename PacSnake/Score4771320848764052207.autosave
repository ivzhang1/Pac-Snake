import java.util.Collections; //<>//
import java.util.*;

public class Score implements Comparable<Score>{
  
  private final int value;
  private final String name;
  
  public Score(){
    this(0,"");
  }
  
  public Score(int value, String name){
    this.value = value;
    this.name = name;
  }
  
  public int getValue(){
    return this.value;
  }
  
  public String getName(){
    return this.name;
  }
  
  public int compareTo(Score other){
    int otherValue = other.getValue();
    return this.getValue() - otherValue;
  }
  
  public String toString(){
    return "[" + this.name + " :" + this.value + "]";
  }
  
  
  
}
