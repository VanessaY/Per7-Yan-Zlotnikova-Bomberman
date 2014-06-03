//implement 4 directions and their pictures

private class Player extends Item{
  //bomb related
  int bombStr, bombsOnField, bombsAllowed;
  
  //player
  int health, speed;
  
  //Bounds of box
  float topLeftX, topLeftY, topRightX, topRightY, botLeftX, botLeftY, botRightX, botRightY;
  PImage sprite;
  public Player(float x, float y, String filename,
                int bombStr, int bombsOnField, int bombsAllowed, 
                int health, int speed, String displayImg){
    super(x, y, displayImg);
    this.bombStr = bombStr;
    this.bombsOnField = bombsOnField;
    this.bombsAllowed = bombsAllowed;
    this.health = health;
    this.speed = speed;
    sprite = loadImage(filename);
    sprite.resize(boxSize, boxSize);
  }
  
  public Player(float x, float y, String filename){
    this(x, y, filename, 1, 0, 1, 3, 8, "images/empty.png");
  }
  
  public Player(float x, float y){
    this(x, y, "images/Player.png");
  }
  
  public void boundUpdate(){
    topLeftX = x + 5;
    topLeftY = y + 5;
    topRightX= x + boxSize-5;
    topRightY= y + 5;
    botLeftX = x + 5;
    botLeftY = y + boxSize - 5;
    botRightX= x + boxSize - 5;
    botRightY= y + boxSize - 5 ;
  }
  
  public void PDisplay(){
    boundUpdate();
    image(sprite, x, y);
  }
  
  private boolean canGo(Item a, Item b){
    return !(a instanceof DestructibleBox || a instanceof IndestructibleBox || b instanceof DestructibleBox || b instanceof IndestructibleBox);
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
