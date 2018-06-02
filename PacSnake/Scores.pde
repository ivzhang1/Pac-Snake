import java.util.Collections;
import java.util.*;

public class Scores{
  private ArrayList<Score> scores;
  
  public Scores(){
  }
  
  //***We have to add name to Scores somehow
  public void addScore(int score, String name){
    scores.add(new Score(score, name));
  }
  
  //returns a sorted list of scres: highest to lowest
  public ArrayList<Score> highestScores(){
    Collections.sort(scores);
    return scores;
  }
  
  public ArrayList<Score> highestScores(int n){
    Collections.sort(scores);
    if (n >= scores.size()){
      return highestScores();
    }else{
      ArrayList<Score> highestNScores = new ArrayList<Score>(scores.subList(scores.size()-n, scores.size()));
      return highestNScores;
    }
  }
  
  
  
}
