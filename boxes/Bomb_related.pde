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
    while (goingLeft >= minX){
      //if the fire is able to get to this spot
      grid[goingLeft][y] = new Fire(goingLeft*50, y*50, 3);
      goingLeft--;
    }
    
    int goingUp = y; 
    while (goingUp >= minY){
      //if the fire is able to get to this spot
      grid[x][goingUp] = new Fire(x*50, goingUp*50, 3);
      goingUp--;
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
