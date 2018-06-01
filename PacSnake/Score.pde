import java.util.Collections;

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
  
  
  
}
