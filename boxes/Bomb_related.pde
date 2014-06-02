public class Bomb extends Item {
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
    
    int x = ((int)this.x)/50; //xcor in grid
    int y = ((int)this.y)/50; //ycor in grid
    int minX = x - strength; //min x set on fire, provided clear space
    if (minX < 1){
      minX = 1; //absolute min is 0
    }
    
    int maxX = x + strength; //max x set on fire, provided clear space
    if (maxX > 8){
      maxX = 8; //absolute max is 9
    }
    
    int minY = y - strength; //same as above
    if (minY < 1){
      minY = 1;
    }
    int maxY = y + strength;
    if (maxY > 8){
      maxY = 8;
    }
    
    
    int goingLeft = x; //starts from bomb location, goes left.
    while (goingLeft >= minX){
      //if the fire is able to get to this spot
      grid[goingLeft][y] = new Fire(goingLeft*50, y*50, 3);
      goingLeft--;
    }
    
    
    int goingRight = x; //starts from bomb location, goes right;
    while (goingRight <= maxX) { 
      grid[goingRight][y] = new Fire(goingRight*50, y*50, 3);
      goingRight++;
    }
    
    
    int goingUp = y; 
    while (goingUp >= minY){
      //if the fire is able to get to this spot
      grid[x][goingUp] = new Fire(x*50, goingUp*50, 3);
      goingUp--;
    }
    
    int goingDown = y; 
    while (goingDown <= maxY) { 
      grid[x][goingDown] = new Fire(x*50, goingDown*50, 3);
      goingDown++;
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
