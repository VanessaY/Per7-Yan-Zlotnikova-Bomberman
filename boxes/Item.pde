public class Item { //also used (for now at least) if there is an empty spot
  protected float x, y, size;
  protected Item[][] arr;
  PImage img;
  
  public Item(float x, float y, 
  String fileName) {
    this.x = x;
    this.y = y;
    this.size = 50;
    this.arr = arr;
    img = loadImage(fileName);
  }

  public Item(float x, float y) {
    this(x, y, "images/empty.png");
  }

  public void display() {
    image(img, x, y);
  }
  
  public void removeSelf(){
    grid[(int)x][(int)y] = new Item(x, y);
  }
}
