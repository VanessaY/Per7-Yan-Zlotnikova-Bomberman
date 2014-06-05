//implement 4 directions and their pictures
//work on lives

private class Player extends Item{
  //bomb related
  int bombStr, bombsOnField, bombsAllowed;
  
  //player
  int health, speed;
  boolean isAlive;
  
  //Bounds of box
  float topLeftX, topLeftY, topRightX, topRightY, botLeftX, botLeftY, botRightX, botRightY;
  
  //approximate location of player
  float centerX, centerY;
  
  //bomb hit variables
  float secInvulnerable; 
  int framesInvulnerable;
  
  PImage sprite;
  public Player(float x, float y, String filename,
                int bombStr, int bombsOnField, int bombsAllowed, 
                int health, int speed, String displayImg){
    super(x, y, displayImg);
    this.isAlive = true;
    this.bombStr = bombStr;
    this.bombsOnField = bombsOnField;
    this.bombsAllowed = bombsAllowed;
    this.health = health;
    this.speed = speed;
    sprite = loadImage(filename);
    sprite.resize(boxSize, boxSize);
    boundUpdate();
  }
  
  public Player(float x, float y, String filename){
    this(x, y, filename, 1, 0, 1, 3, 5, "images/empty.png");
  }
  
  public Player(float x, float y){
    this(x, y, "images/Player.png");
  }
  
  public void boundUpdate(){
    topLeftX = x + 3;
    topLeftY = y + 3;
    topRightX= x + boxSize-3;
    topRightY= y + 3;
    botLeftX = x + 3;
    botLeftY = y + boxSize - 3;
    botRightX= x + boxSize - 3;
    botRightY= y + boxSize - 3 ;
    centerX = x + (boxSize/2);
    centerY = y + (boxSize/2);
  }
  
  public void PDisplay(){
    boundUpdate();
    image(sprite, x, y);
    rect(centerX - 5, centerY - 5, 10, 10);
  }
  
  private boolean canGo(Item a, Item b){
     if (a instanceof DestructibleBox || a instanceof IndestructibleBox || a instanceof Bomb ||
         b instanceof DestructibleBox || b instanceof IndestructibleBox || b instanceof Bomb){
           return false;
         }
     else{
       int xCor = (int)(centerX/boxSize);
       int yCor = (int)(centerY/boxSize);
       if (grid[xCor][yCor] instanceof Fire){
         getHit();
       }
       else if (grid[xCor][yCor] instanceof SpeedUp) { 
         speed = speed + 1;
         grid[xCor][yCor] = new Item(xCor*boxSize, yCor*boxSize);
       } 
       else if (grid[xCor][yCor] instanceof HealthUp) { 
         health = health + 1;
         grid[xCor][yCor] = new Item(xCor*boxSize, yCor*boxSize);
       }
       else if (grid[xCor][yCor] instanceof StrUp) { 
         bombStr = bombStr + 1;
         grid[xCor][yCor] = new Item(xCor*boxSize, yCor*boxSize);
       }
       return true;
     }
  }
  
  public void moveUp(){
    Item topLeftIn = grid[(int)(topLeftX/boxSize)][(int)((topLeftY-speed)/boxSize)];
    Item topRightIn = grid[(int)(topRightX/boxSize)][(int)((topRightY-speed)/boxSize)];
    if (canGo(topLeftIn, topRightIn)){
      y = y - speed;
    }
  }
  public void moveDown(){
    Item botLeftIn = grid[(int)(botLeftX/boxSize)][(int)((botLeftY+speed)/boxSize)];
    Item botRightIn = grid[(int)(botRightX/boxSize)][(int)((botRightY+speed)/boxSize)];
    if (canGo(botLeftIn, botRightIn)){
      y = y + speed;
    }
  }
  public void moveLeft(){
    Item topLeftIn = grid[(int)((topLeftX-speed)/boxSize)][(int)(topLeftY/boxSize)];
    Item botLeftIn = grid[(int)((botLeftX-speed)/boxSize)][(int)(botLeftY/boxSize)];
    if (canGo(topLeftIn, botLeftIn)){
      x = x - speed;
    }
  }
  public void moveRight(){
    Item topRightIn = grid[(int)((topRightX+speed)/boxSize)][(int)(topRightY/boxSize)];
    Item botRightIn = grid[(int)((botRightX+speed)/boxSize)][(int)(botRightY/boxSize)];
    if (canGo(topRightIn, botRightIn)){
      x = x + speed;
    }
  }
  
  public void dropBomb(){
    int xLoc = (int)(centerX/boxSize);
    int yLoc = (int)(centerY/boxSize);
    grid[xLoc][yLoc] = new Bomb(xLoc*boxSize, yLoc*boxSize, bombStr);
  }
  
  public void getHit(){
    health--;
    if (health == 0){
      die();
    }
  }
  
  public void die(){
    isAlive = false;
  }
}

private class PlayerA extends Player{
  public PlayerA(float x, float y){
    super(x, y, "images/PlayerA.png");
  }
}

private class PlayerB extends Player{
  public PlayerB(float x, float y){
    super(x, y, "images/PlayerB.png");
  }
}

private class PlayerC extends Player{
  public PlayerC(float x, float y){
    super(x, y, "images/PlayerC.png");
  }
}

private class PlayerD extends Player{
  public PlayerD(float x, float y){
    super(x, y, "images/PlayerD.png");
  }
}
