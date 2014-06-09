public class Animation{
  PImage[] images;
  int currentFrame;
  int maxFrames;
  Stack<PImage> st = new Stack(); //creates empty stack

 
  public Animation(PImage[] images){
    for (int i=0; i<images.length; i++) { 
      st.push(images[i]);
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
