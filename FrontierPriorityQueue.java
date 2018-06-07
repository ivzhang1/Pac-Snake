public class FrontierPriorityQueue implements Frontier{
    public MyHeap<Location> pQueue;
    
    public FrontierPriorityQueue(){
	pQueue = new MyHeap<>(false);
    }

    public Location next(){
	return pQueue.remove();
    }
    public void add(Location n){
	pQueue.add(n);
    }
	    
    public boolean hasNext(){
	return pQueue.size() > 0;
    }

    public String toString(){
	String res = pQueue.toString();
	return res;
    }
}
