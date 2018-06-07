public class MyHeap<T extends Comparable<T>> {
  public T[] heap;
  public int size = 0;
  public boolean max = true;

  //construct empty max heap
  @SuppressWarnings("unchecked")
    public MyHeap() {
    heap = (T[])new Comparable[10];
  }

  //true: construct empty max heap, false: construct empty min heap.
  public MyHeap(boolean isMax) {
    this();
    max = isMax;
  }

  public int compare(T a, T b) {
    int res = a.compareTo(b);
    if (!max) res*=-1;
    return res;
  }

  public int size() {
    return size;
  }

  @SuppressWarnings("unchecked")
    public void resize() {
    T[] temph = (T[])new Comparable[size*2];
    for (int i = 0; i < size; i++) {
      temph[i] = heap[i];
    }
    heap = temph;
  }

  public T peek() {
    return heap[0];
  }

  public void add(T s) {
    if (size == heap.length) {
      resize();
    }
    heap[size] = s;
    pushUp(s, size);
    size+=1;
  }

  public T remove() {
    if (size == 0) {
      return null;
    }

    T r = heap[0];
    heap[0] = heap[size-1];
    //System.out.println(
    pushDown(heap[size-1], 0);
    heap[size-1] = null;

    size -= 1;
    return r;
  }

  private void pushUp(T c, int starting) {
    int id = (starting - 1) / 2;
    if (compare(c, heap[id]) > 0) {
      swap(heap, starting, id);
      pushUp(c, id);
      pushDown(c, id);
    }
  }

  private void pushDown(T c, int starting) {
    int id = 2 * starting;

    if (id+1 >= size || id+2 >= size) {
    } else if (compare(heap[id + 1], c) >= 0 && compare(heap[id + 1], heap[id+2]) >= 0) {
      swap(heap, starting, id + 1);
      pushDown(c, id+1);
    } else if (compare(heap[id + 2], c) >= 0 && compare(heap[id + 2], heap[id+1]) >= 0) {
      swap(heap, starting, id + 2);
      pushDown(c, id + 2);
    }
  }

  private void swap(T[] base, int one, int two) {
    T temp = base[one];
    base[one] = base[two];
    base[two] = temp;
  }

  public String toString() {
    String res = "[";
    for (int i = 0; i < size; i++) {
      res += heap[i] + ", ";
    }

    return res + "]";
  }
}