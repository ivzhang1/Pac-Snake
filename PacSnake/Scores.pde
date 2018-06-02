import java.util.Collections;
import java.util.*;

public class Scores {
  private ArrayList<Score> scoreList;

  public Scores() {
    
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
  
}
