private class Item{ //also used (for now at least) if there is an empty spot
  private float x, y, size;
  PImage img;
  //CHANGE COLOR INTO PICTURE
  
  public Item(float x, float y,
              String fileName){
    this.x = x;
    this.y = y;
    this.size = 50;
    img = loadImage(fileName);
  }
  
  public Item(float x, float y){
    this(x, y, "images/empty.png");
  }
  
  public void display(){
    image(img, x, y);
  }
}
  
private class Box extends Item{
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

private class IndestructibleBox extends Box{
  public IndestructibleBox(float x, float y){
      super(x, y, "images/indestructible.png", -1, 0);
  }
  public void display(){
    super.display();
  }
}

private class DestructibleBox extends Box{
  public DestructibleBox(float x, float y, int toDestroy){
    super(x, y, "images/destructible.png", toDestroy, 0);
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

private class Bomb extends Item{ 
  int tMinusSeconds;
  int strength;
  
  public Bomb(float x, float y, int tMinusSeconds, String img, int str) {
    super(x,y,img);
    strength = str;
    this.tMinusSeconds = tMinusSeconds;
  }
  
  public Bomb(float x, float y, int tMinusSeconds, int str) { //for the typical black bomb
    super(x,y,"images/bomb.png");
    strength = str;
    this.tMinusSeconds = tMinusSeconds;
  }
  
  public void explode() { 
      
  }
}

private class Fire extends Item { 
    int tMinusSeconds; 
    
    public Fire(float x, float y, int tMinusSeconds, int strength) { 
      super(x,y,"images/fire.png");
      for (int i=x; i<x+strength; i++) { 
        super(i,y,"images/fire.png");
      }
      for (int i=y; i<y+strength; i++) { 
        super(x,i,"images/fire.png");
      }
    }
   
}
