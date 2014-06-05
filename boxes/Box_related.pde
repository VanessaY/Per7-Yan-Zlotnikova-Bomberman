import java.util.*;

private class Box extends Item {
  int toDestroy;
  int hitsTaken;
  color fillColor, strokeColor;

  public Box(float x, float y, 
             String img, 
              int toDestroy, int hitsTaken) {
    super(x, y, img);
    this.toDestroy = toDestroy;
    this.hitsTaken = hitsTaken;
  }

  public void display() { 
    super.display();
  }
}

private class IndestructibleBox extends Box {
  public IndestructibleBox(float x, float y) {
    super(x, y, "images/indestructible.png", -1, 0);
  }
}

private class DestructibleBox extends Box {
  int percentDrop;
  
  public DestructibleBox(float x, float y, int toDestroy, int percentDrop) {
    super(x, y, "images/destructible.png", toDestroy, 0);
    this.percentDrop = percentDrop;
  }
  public DestructibleBox(float x, float y) {
    this(x, y, 1, 100);
  }

  public void takeHit() {
    hitsTaken++;
    if (hitsTaken == toDestroy){
      grid[(int)x/boxSize][(int)y/boxSize] = new Fire(x, y, checkDrop());
    }
  }
  
  public boolean checkDrop(){
    Random r = new Random();
    int x = r.nextInt(100);
    return (x < percentDrop);
  }
}
