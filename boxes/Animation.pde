public class Animation{
  PImage[] images;
  int currentFrame;
  int maxFrames;
  List<PImage> LL = new LinkedList<PImage>(); //creates empty queue
 
  public Animation(PImage[] images){
    for (int i=0; i<images.length; i++) { 
      LL.add(images[i]); //apends at end of list
    }
    this.images = images;
    currentFrame = 0;
    maxFrames = images.length;
  }
  
  public void display(float x, float y){
    if (currentFrame == maxFrames){
      currentFrame = 0;
    }
    image(images[currentFrame], x, y);
    currentFrame++;
  }
}
