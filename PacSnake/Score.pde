import java.util.*; //<>// //<>//
import java.util.Collections;
 
public class Score implements Comparable<Score>{
  
  private int value;
  private final String name;
  
  public Score(){
    this(0,"");
  }
  public Score(int value){
    this.value = value;
    this.name = "";
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
  
  public void addToScore(int toAdd){
    value += toAdd;
  }
  
  public int compareTo(Score other){
    int otherValue = other.getValue();
    return this.getValue() - otherValue;
  }
  
  public String toString(){
    return "[" + this.name + " :" + this.value + "]";
  }
  
  
  
}