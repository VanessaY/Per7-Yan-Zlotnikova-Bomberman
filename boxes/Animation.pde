public class Animate{
  PImage[] images;
  int currentFrame;
  int maxFrames;
  public Animate(PImage[] images){
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
