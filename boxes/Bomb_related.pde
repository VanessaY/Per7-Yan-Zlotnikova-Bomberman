public class Bomb extends Item {
  float tMinusSeconds;
  int framesToDetonate;
  int strength;

  public Bomb(float x, float y, float tMinusSeconds, String img, int str) {
    super(x, y, img);
    this.strength = str;
    this.tMinusSeconds = tMinusSeconds;
    this.framesToDetonate = (int)tMinusSeconds*60;
  }

  public Bomb(float x, float y, float tMinusSeconds, int str) { //for the typical black bomb
    this(x, y, tMinusSeconds, "images/bomb.png", str);
  }

  public Bomb(float x, float y, int str){
    this(x, y, 2, str);
  }
  
  public Bomb(float x, float y){
    this(x, y, 2, 2);
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
        grid[goingLeft][y] = new Fire(goingLeft*boxSize, y*boxSize);
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
        grid[goingRight][y] = new Fire(goingRight*boxSize, y*boxSize);
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
        grid[x][goingUp] = new Fire(x*boxSize, goingUp*boxSize);
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
        grid[x][goingDown] = new Fire(x*boxSize, goingDown*boxSize);
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
  
  public Fire(float x, float y, float tMinusSeconds) { 
    super(x, y, "images/fire.png");
    this.tMinusSeconds = tMinusSeconds;
    this.framesToDelete = (int)(tMinusSeconds*60);
  }
  
  public Fire(float x, float y){
    this(x, y, 1);
  }
  
  public void countDown(){
    if (framesToDelete == 0){
      removeSelf();
    }
    else{
      framesToDelete--;
    }
  }
}
