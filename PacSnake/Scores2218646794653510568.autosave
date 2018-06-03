import java.util.Collections;
import java.util.*;

public class Scores {
  private ArrayList<Score> scoreList;
  
  void setup() {
   size(200, 200);
   background(100);
   stroke(255);
   ellipse(50, 50, 25, 25);
   println("hello web!");
 }


  public Scores() {
    scoreList = new ArrayList<Score>();
  }

  //***We have to add name to Scores somehow
  public void addScore(int score, String name) {
    scoreList.add(new Score(score, name));
  }

  //returns a sorted list of scres: highest to lowest
  public ArrayList<Score> highestScores() {
    Collections.sort(scoreList);
    return scoreList;
  }

  public ArrayList<Score> highestScores(int n) {
    Collections.sort(scoreList);
    if (n >= scoreList.size()) {
      return highestScores();
    } else {
      ArrayList<Score> highestNScores = new ArrayList<Score>(scoreList.subList(scoreList.size()-n, scoreList.size()));
      return highestNScores;
    }
  }
  
  public String toString(){
    Collections.sort(scoreList);
    String gath = "";
    for (Score i: scoreList){
      gath += i;
    }
    return gath;
  }
  
}
