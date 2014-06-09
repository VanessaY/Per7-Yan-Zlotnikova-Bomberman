public class Animation {
  LinkedList<PImage> LL = new LinkedList<PImage>(); //creates empty queue

  public Animation(PImage[] images) {
    for (int i=0; i<images.length; i++) { 
      LL.add(images[i]); //apends at end of list
    }
  }

  public PImage nextFrame() {
    PImage next;
    next = LL.removeFirst();
    LL.addLast(next);
    return next;
  }
}

