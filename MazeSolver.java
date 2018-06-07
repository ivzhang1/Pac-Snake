public class MazeSolver{
    private Maze maze;
    private Frontier frontier;

    public static void main(String[] args){
	if(args.length == 2){
	    MazeSolver m = new MazeSolver(args[0]);
	    System.out.println(m.solve(Integer.parseInt(args[1])));
	    //System.out.println(m);
	}
	
	//MazeSolver n = new MazeSolver(args[0]);
	//System.out.println(n.solve(1));
	//System.out.println(n);

	
    }
    

    
    public MazeSolver(String mazeText){
	maze = new Maze(mazeText);
    }

    //Default to BFS
    public boolean solve(){ return solve(0); }

    //mode: required to allow for alternate solve modes.
    //0: BFS
    //1: DFS
    public boolean solve(int mode){
	if(mode == 0){
	    frontier = new FrontierQueue();
	}
	else if (mode == 1){
	    frontier = new FrontierStack();
	}
	else{
	    frontier = new FrontierPriorityQueue();
	}
	if(mode == 3){
	    maze.setAStar();
	}


	frontier.add(maze.getStart());
	Location end = maze.getEnd();

	while(frontier.hasNext()){
	    
	    Location prev = frontier.next();
	    //System.out.println(prev.distance());
	    Location[] nextL = maze.getNeighbors(prev);

	    for(Location l: nextL){
		//System.out.println(frontier);

		if(l != null){
		    //System.out.println(l.distance());

		    //System.out.println(l.distance());
		    char chary = maze.get(l.xL(), l.yL());
		    if(chary == 'E'){
			maze.set(prev.xL(), prev.yL(), '.');
			maze.end = new Location(l.xL(), l.yL(), prev);
			end = maze.getEnd();
			while(end.loc() != null && !end.loc().equals(maze.getStart())){
			    end = end.loc();
			    maze.set(end.xL(), end.yL(), '@');
	    			    
			}
			//System.out.println(maze.toStringColor());

			return true;
		    }
		    //return true;
		    if(chary == '?'){
			frontier.add(l);
		    }
		}
	    }
	    //System.out.println(maze.toStringColor());
	    if(maze.get(prev.xL(), prev.yL()) != 'S'){
		maze.set(prev.xL(), prev.yL(), '.');
	    }
	}
      
	return false;
    }

    public String toString(){
	return maze.toString();
    }
}

