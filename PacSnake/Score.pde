import java.util.Collections;
import java.util.*;

public class Score{
  private ArrayList<Integer> scores;
  
  public Score(){
  }
  
  //***We have to add name to Scores somehow
  public void addScore(int score, String name){
    scores.add(score);
  }
  
  //returns a sorted list of scres: highest to lowest
  public ArrayList<Integer> highestScores(){
    Collections.sort(scores);
    return scores;
  }
  
  public ArrayList<Integer> highestScores(int n){
    Collections.sort(scores);
    if (n >= scores.size()){ //<>//
      return highestScores();
    }else{
      ArrayList<Integer> highestNScores = new ArrayList<Integer>(scores.subList(scores.size()-n, scores.size()));
      return highestNScores;
    }
  }
  
  
  
}
