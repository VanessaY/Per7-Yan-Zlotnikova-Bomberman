private class Item { //also used (for now at least) if there is an empty spot
  private float x, y, size;
  PImage img;
  //CHANGE COLOR INTO PICTURE

  public Item(float x, float y, 
  String fileName) {
    this.x = x;
    this.y = y;
    this.size = 50;
    img = loadImage(fileName);
  }

  public Item(float x, float y) {
    this(x, y, "images/empty.png");
  }

  public void display() {
    image(img, x, y);
  }

  public float getX() { 
    return x;
  }

  public float getY() { 
    return y;
  }
}

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
  public void display() {
    super.display();
  }
}

private class DestructibleBox extends Box {
  public DestructibleBox(float x, float y, int toDestroy) {
    super(x, y, "images/destructible.png", toDestroy, 0);
  }
  public DestructibleBox(float x, float y) {
    this(x, y, 1);
  }

  public void display() {
    super.display();
  }

  public void takeHit() {
    hitsTaken++;
  }
}

private class Bomb extends Item { 
  int tMinusSeconds;
  int strength;

  public Bomb(float x, float y, int tMinusSeconds, String img, int str) {
    super(x, y, img);
    strength = str;
    this.tMinusSeconds = tMinusSeconds;
  }

  public Bomb(float x, float y, int tMinusSeconds, int str) { //for the typical black bomb
    super(x, y, "images/bomb.png");
    strength = str;
    this.tMinusSeconds = tMinusSeconds;
  }

  public void explode() { 

    int i = (int)getX()/50-strength;
    int ix = (int)getX()/50; //constant
    int maxX = (int)getX()/50+strength;
    int j = (int)getY()/50-strength;
    int jy = (int)getY()/50; //constant
    int maxY = (int)getY()/50 + 2*strength;
    strength;
    while (i<=maxX) { 
//if ((grid[i][jy] instanceof Bomb) || !(grid[i][jy] instanceof IndestructibleBox)) { 
        grid[i][jy] = new Fire(i*50, jy*50, 3);
        i++;
    }
   
    while (j<=maxY) { 
      grid[ix][j] = new Fire(ix*50, j*50, 3);
      j++;
    }
    
  }
}

  private class Fire extends Item { 
    int tMinusSeconds; 

    public Fire(float x, float y, int tMinusSeconds) { 
      super(x, y, "images/fire.png");
      this.tMinusSeconds = tMinusSeconds;
    }
  }


