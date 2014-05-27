private class Item{ //also used (for now at least) if there is an empty spot
  private float x, y, size;
  color fillColor, strokeColor;
  //CHANGE COLOR INTO PICTURE
  
  public Item(float x, float y,
              color fillColor, color strokeColor){
    this.x = x;
    this.y = y;
    this.size = 50;
    this.fillColor = fillColor;
    this.strokeColor = strokeColor;
  }
  
  public Item(float x, float y){
    this(x, y, 255, 255);
  }
  
  public void display(){
    fill(fillColor);
    stroke(strokeColor);
    rect(x, y, size, size);
  }
}
  
private class Box extends Item{
  private float x, y, size;
  int toDestroy;
  int hitsTaken;
  color fillColor, strokeColor;
 
  public Box(float x, float y,
             color fillColor, color strokeColor,
             int toDestroy, int hitsTaken) {
    super(x, y, fillColor, strokeColor);
    this.toDestroy = toDestroy;
    this.hitsTaken = hitsTaken;
  }
  
  public void display() { 
    super.display();
  }
}

private class IndestructibleBox extends Box{
  public IndestructibleBox(float x, float y){
      super(x, y, 50, 255, -1, 0);
  }
  public void display(){
    super.display();
  }
}

private class DestructibleBox extends Box{
  public DestructibleBox(float x, float y, int toDestroy){
    super(x, y, 200, 255, toDestroy, 0);
  }
  public DestructibleBox(float x, float y){
    this(x, y, 1);
  }
  
  public void display(){
    super.display();
  }
  
  public void takeHit(){
    hitsTaken++;
  }
}

