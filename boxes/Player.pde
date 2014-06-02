//implement 4 directions and their pictures

private class Player extends Item{
  //bomb related
  int bombStr, bombsOnField, bombsAllowed;
  
  //player
  int health, speed;
  
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
    this(x, y, filename, 1, 0, 1, 2, 5, "images/empty.png");
  }
  
  public Player(float x, float y){
    this(x, y, "images/Player.png");
  }
  
  public void PDisplay(){
    image(sprite, x, y);
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
