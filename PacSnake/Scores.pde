import java.util.Collections;
import java.util.*;

public class Scores {
  private ArrayList<Score> scoreList;

  public Scores() {
    scoreList = new ArrayList<Score>();
  }

  public void addScore(int score, String name) {
    scoreList.add(new Score(score, name));
  }

  //supposed to return a sorted list of scres: highest to lowest
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
