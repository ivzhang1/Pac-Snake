private int livesLeft;
private int pointsEarned;
private Board board;
private Scores scoreboard;
private Ghost[] ghosts;
private PacThing main;

//pushMatrix(), popMatrix()
//public void setup(){
//  //Board b = new Board("Pac-Snake/default.txt");
//}

void setup() {
   Scores blah = new Scores();
   blah.addScore(12,"ivan");
   blah.addScore(20,"george");
   blah.addScore(5,"a");
   blah.addScore(200,"d");
   blah.addScore(15,"b");
   blah.addScore(23,"c");
   blah.addScore(23,"c");
   
   for (Score i: Scores){
      System.out.println(i);
    }
   
 }


public void draw(){
}
