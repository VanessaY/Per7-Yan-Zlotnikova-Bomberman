//if hit with fire, explode

public class Bomb extends Item {
  float tMinusSeconds;
  int framesToDetonate;
  int strength;
  Player p;

  public Bomb(float x, float y, float tMinusSeconds, String img, int str, Player p) {
    super(x, y, img);
    this.strength = str;
    this.tMinusSeconds = tMinusSeconds;
    this.framesToDetonate = (int)tMinusSeconds*60;
    this.p = p;
  }

  public Bomb(float x, float y, float tMinusSeconds, int str, Player p) { //for the typical black bomb
    this(x, y, tMinusSeconds, "images/bomb.png", str, p);
  }

  public Bomb(float x, float y, int str, Player p){
    this(x, y, 2, str, p);
  }
  
  public Bomb(float x, float y, Player p){
    this(x, y, 2, 2, p);
  }
  
  public void countDown(){
    if (framesToDetonate == 0){
      explode();
    }
    else{
      framesToDetonate--;
    }
  }
  
  public void explode() {
    p.decreaseBombsOnField();
    int x = ((int)this.x)/boxSize; //xcor in grid
    int y = ((int)this.y)/boxSize; //ycor in grid
    int minX = x - strength; //min x set on fire, provided clear space
    if (minX < 0){
      minX = 0; //absolute min is 0
    }
    
    int maxX = x + strength; //max x set on fire, provided clear space
    if (maxX > 9){
      maxX = 9; //absolute max is 9
    }
    
    int minY = y - strength; //same as above
    if (minY < 0){
      minY = 0;
    }
    int maxY = y + strength;
    if (maxY > 9){
      maxY = 9;
    }
    
    int goingLeft = x; //starts from bomb location, goes left.
    while (goingLeft >= minX && !(grid[goingLeft][y] instanceof IndestructibleBox)){
      //if the fire is able to get to this spot
      if (grid[goingLeft][y] instanceof DestructibleBox){
        ((DestructibleBox)grid[goingLeft][y]).takeHit();
        goingLeft = minX - 1;
      }
      else{
        grid[goingLeft][y] = new Fire(goingLeft*boxSize, y*boxSize);
        goingLeft--;
      }
    }    
    
    int goingRight = x; //starts from bomb location, goes right;
    while (goingRight <= maxX && !(grid[goingRight][y] instanceof IndestructibleBox)) { 
      if (grid[goingRight][y] instanceof DestructibleBox){
        ((DestructibleBox)grid[goingRight][y]).takeHit();
        goingRight = maxX + 1;
      }
      else{
        grid[goingRight][y] = new Fire(goingRight*boxSize, y*boxSize);
        goingRight++;
      }
    }
    
    int goingUp = y; 
    while (goingUp >= minY && !(grid[x][goingUp] instanceof IndestructibleBox)){
      if (grid[x][goingUp] instanceof DestructibleBox){
        ((DestructibleBox)grid[x][goingUp]).takeHit();
        goingUp = minY - 1;
      }
      else{
        grid[x][goingUp] = new Fire(x*boxSize, goingUp*boxSize);
        goingUp--;
      }
    }
    
    int goingDown = y; 
    while (goingDown <= maxY && !(grid[x][goingDown] instanceof IndestructibleBox)) { 
      if (grid[x][goingDown] instanceof DestructibleBox){
        ((DestructibleBox)grid[x][goingDown]).takeHit();
        goingDown = maxY + 1;
      }
      else{
        grid[x][goingDown] = new Fire(x*boxSize, goingDown*boxSize);
        goingDown++;
      }
    }
  }
}
    
private class Fire extends Item { 
  float tMinusSeconds; 
  int framesToDelete;
  boolean isDrop;
  
  public Fire(float x, float y, float tMinusSeconds, boolean isDrop) { 
    super(x, y, "images/fire.png");
    this.tMinusSeconds = tMinusSeconds;
    this.framesToDelete = (int)(tMinusSeconds*60);
    this.isDrop = isDrop;
  }
  
  public Fire(float x, float y, Boolean b){
    this(x, y, 1, b);
  }
  
  public Fire(float x, float y){
    this(x, y, 1, false);
  }
  
  public void countDown(){
    if (framesToDelete == 0){
      if (isDrop){
        drop();
      }
      else{
        removeSelf();
      }
    }
    else{
      framesToDelete--;
    }
  }
  
  public void drop(){
    Random r = new Random();
    int p = r.nextInt(4);
    if (p == 0){
      grid[(int)(x/boxSize)][(int)(y/boxSize)] = new SpeedUp(x, y);
    }
    else if (p == 1){
      grid[(int)(x/boxSize)][(int)(y/boxSize)] = new HealthUp(x, y);      
    }
    else if (p == 2){
      grid[(int)(x/boxSize)][(int)(y/boxSize)] = new StrUp(x, y);
    }
    else if (p == 3){
      grid[(int)(x/boxSize)][(int)(y/boxSize)] = new BombUp(x, y);
    }
  }
}
