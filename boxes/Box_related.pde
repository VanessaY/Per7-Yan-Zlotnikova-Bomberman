private class Box extends Item {
  private float x, y, size;
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
  public DestructibleBox(float x, float y, int toDestroy) {
    super(x, y, "images/destructible.png", toDestroy, 0);
  }
  public DestructibleBox(float x, float y) {
    this(x, y, 1);
  }

  public void takeHit() {
    hitsTaken++;
    if (hitsTaken == toDestroy){
      removeSelf();
    }
  }
}
