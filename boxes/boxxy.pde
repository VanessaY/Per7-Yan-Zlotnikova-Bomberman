private class Item{ //also used (for now at least) if there is an empty spot
  private float x, y, size;
  color fillColor, strokeColor;
  //CHANGE COLOR INTO PICTURE
  
  public Item(float x, float y,
              color fillColor, color strokeColor){
    this.x = x;
    this.y = y;
    this.size = 20;
    this.fillColor = fillColor;
    this.strokeColor = strokeColor;
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
