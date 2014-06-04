public class Item { //also used (for now at least) if there is an empty spot
  protected float x, y, size;
  protected Item[][] arr;
  PImage img;
  
  public Item(float x, float y, 
  String fileName) {
    this.x = x;
    this.y = y;
    this.size = boxSize;
    this.arr = arr;
    img = loadImage(fileName);
    img.resize(boxSize, boxSize);
  }

  public Item(float x, float y) {
    this(x, y, "images/empty.png");
  }

  public void display() {
    image(img, x, y);
  }
  
  public void removeSelf(){
    grid[(int)(x/boxSize)][(int)(y/boxSize)] = new Item(x, y);
  }
}
