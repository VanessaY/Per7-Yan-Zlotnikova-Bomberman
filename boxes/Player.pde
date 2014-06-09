//implement 4 directions and their pictures
//transparencies when invulnerable
private class Player extends Item {
  //bomb related
  int bombStr, bombsOnField, bombsAllowed;

  //player
  int health, speed;
  boolean isAlive;
  PImage sprite;

  //Bounds of box
  float topLeftX, topLeftY, topRightX, topRightY, botLeftX, botLeftY, botRightX, botRightY;

  //approximate location of player
  float centerX, centerY;

  //bomb hit variables
  float secInvulnerable; 
  int framesInvulnerable;

  //movement after bomb placement
  boolean isOnBomb;

  //animaton variables
  boolean isLeft, isRight, isUp, isDown, isMoving, isDying;
  boolean mL, mR, mU, mD;
  Animation left, right, up, down, stillL, stillR, stillU, stillD, dying, thisOne;
  String letter;
  int framesPerFrame, currently;
  PImage frame;

  public Player(float x, float y, String filename, 
  int bombStr, int bombsOnField, int bombsAllowed, 
  int health, int speed, String displayImg, String letter) {
    super(x, y, displayImg);
    this.isAlive = true;
    this.bombStr = bombStr;
    this.bombsOnField = bombsOnField;
    this.bombsAllowed = bombsAllowed;
    this.health = health;
    this.speed = speed;
    this.letter = letter;
    framesPerFrame = framerate/10;
    currently = 0;
    sprite = loadImage(filename);
    sprite.resize(boxSize, boxSize);
    boundUpdate();
    setAnim();
    isDown = true;
  }

  public Player(float x, float y, String filename, String letter) {
    this(x, y, filename, 2, 0, 1, 2, 2, "images/empty.png", letter);
  }

  public Player(float x, float y, String letter) {
    this(x, y, "images/Player.png", letter);
  }

  public void boundUpdate() {
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

  public void PDisplay() {
    if (health <= 0){
      die();
    }
    if (grid[(int)centerX/boxSize][(int)centerY/boxSize] instanceof Fire) {
      getHit();
    }
    boundUpdate();
    isOnBombUpdate();
    if (ghettoMode) {
      image(sprite, x, y);
    } else {
      turnMoving();
      if (isDying) {
        thisOne = dying;
      } else if (isMoving) {
        if (isLeft) {
          thisOne = left;
        } else if (isRight) {
          thisOne = right;
        } else if (isUp) {
          thisOne = up;
        } else if (isDown) {
          thisOne = down;
        }
      } else {
        if (isLeft) {
          thisOne = stillL;
        } else if (isRight) {
          thisOne = stillR;
        } else if (isUp) {
          thisOne = stillU;
        } else if (isDown) {
          thisOne = stillD;
        }
      }
      if (currently > framesPerFrame) {
        currently = 0;
        frame = thisOne.nextFrame();
      } else {
        currently++;
      }
      image(frame, x, y);
    }
  }

  public void setAnim() {
    String s = "images/officialmode/player" + letter + "/";

    String sLeft = s + "moveleft/";
    PImage[] arr = new PImage[1];
    arr[0] = loadImage(sLeft + "still.png");
    stillL = new Animation(arr);

    arr = new PImage[4];
    arr[0] = loadImage(sLeft + "still.png");
    arr[1] = loadImage(sLeft + "move1.png");
    arr[2] = loadImage(sLeft + "still.png");
    arr[3] = loadImage(sLeft + "move2.png");
    left = new Animation(arr);

    String sRight = s + "moveright/";
    arr = new PImage[1];
    arr[0] = loadImage(sRight + "still.png");
    stillR = new Animation(arr);

    arr = new PImage[4];
    arr[0] = loadImage(sRight + "still.png");
    arr[1] = loadImage(sRight + "move1.png");
    arr[2] = loadImage(sRight + "still.png");
    arr[3] = loadImage(sRight + "move2.png");
    right = new Animation(arr);

    String sUp = s + "moveup/";
    arr = new PImage[1];
    arr[0] = loadImage(sUp + "still.png");
    stillU = new Animation(arr);

    arr = new PImage[4];    
    arr[0] = loadImage(sUp + "still.png");
    arr[1] = loadImage(sUp + "move1.png");
    arr[2] = loadImage(sUp + "still.png");
    arr[3] = loadImage(sUp + "move2.png");
    up = new Animation(arr);

    String sDown = s + "movedown/";
    arr = new PImage[1];
    arr[0] = loadImage(sDown + "still.png");
    stillD = new Animation(arr);

    arr = new PImage[4];    
    arr[0] = loadImage(sDown + "still.png");
    arr[1] = loadImage(sDown + "move1.png");
    arr[2] = loadImage(sDown + "still.png");
    arr[3] = loadImage(sDown + "move2.png");
    down = new Animation(arr);

    String d = s + "death/death";
    arr = new PImage[8];
    arr[0] = loadImage(d + "1.png");
    arr[1] = loadImage(d + "2.png");
    arr[2] = loadImage(d + "3.png");
    arr[3] = loadImage(d + "4.png");
    arr[4] = loadImage(d + "5.png");
    arr[5] = loadImage(d + "6.png");
    arr[6] = loadImage(d + "7.png");
    arr[7] = loadImage(d + "8.png");
  }
  public void turnLeft() {
    isLeft = true;
    isRight = false;
    isUp = false;
    isDown = false;
  }
  public void turnRight() {
    isLeft = false;
    isRight = true;
    isUp = false;
    isDown = false;
  }
  public void turnUp() {
    isLeft = false;
    isRight = false;
    isUp = true;
    isDown = false;
  }
  public void turnDown() {
    isLeft = false;
    isRight = false;
    isUp = false;
    isDown = true;
  }
  public void turnDead() {
    isDying = true;
  }
  public void turnMoving() {
    isMoving = (mU || mD || mL || mR);
  }
  private boolean isOnBombHelper(float xCor, float yCor) {
    int x = (int)(xCor/boxSize);
    int y = (int)(yCor/boxSize);
    return grid[x][y] instanceof Bomb;
  }

  private void isOnBombUpdate() {
    isOnBomb = (isOnBombHelper(topLeftX, topLeftY) || isOnBombHelper(topRightX, topRightY) ||
      isOnBombHelper(botLeftX, botLeftY) || isOnBombHelper(botRightX, botRightY));
  }

  private boolean canGo(Item a, Item b) {
    if (a instanceof DestructibleBox || a instanceof IndestructibleBox ||
      b instanceof DestructibleBox || b instanceof IndestructibleBox) {
      return false;
    } else if (!isOnBomb &&(a instanceof Bomb || b instanceof Bomb)) {
      return false;
    } else {
      int xCor = (int)(centerX/boxSize);
      int yCor = (int)(centerY/boxSize);
      if (grid[xCor][yCor] instanceof Fire) {
        getHit();
      } else if (grid[xCor][yCor] instanceof SpeedUp) { 
        speed = speed + 1;
        grid[xCor][yCor] = new Item(xCor*boxSize, yCor*boxSize);
      } else if (grid[xCor][yCor] instanceof HealthUp) { 
        health = health + 1;
        grid[xCor][yCor] = new Item(xCor*boxSize, yCor*boxSize);
      } else if (grid[xCor][yCor] instanceof StrUp) { 
        bombStr = bombStr + 1;
        grid[xCor][yCor] = new Item(xCor*boxSize, yCor*boxSize);
      } else if (grid[xCor][yCor] instanceof BombUp) {
        bombsAllowed++;
        grid[xCor][yCor] = new Item(xCor*boxSize, yCor*boxSize);
      }
      return true;
    }
  }

  public void moveUp() {
    turnUp();
    Item topLeftIn = grid[(int)(topLeftX/boxSize)][(int)((topLeftY-speed)/boxSize)];
    Item topRightIn = grid[(int)(topRightX/boxSize)][(int)((topRightY-speed)/boxSize)];
    if (canGo(topLeftIn, topRightIn)) {
      y = y - speed;
    }
  }
  public void moveDown() {
    turnDown();
    Item botLeftIn = grid[(int)(botLeftX/boxSize)][(int)((botLeftY+speed)/boxSize)];
    Item botRightIn = grid[(int)(botRightX/boxSize)][(int)((botRightY+speed)/boxSize)];
    if (canGo(botLeftIn, botRightIn)) {
      y = y + speed;
    }
  }
  public void moveLeft() {
    turnLeft();
    Item topLeftIn = grid[(int)((topLeftX-speed)/boxSize)][(int)(topLeftY/boxSize)];
    Item botLeftIn = grid[(int)((botLeftX-speed)/boxSize)][(int)(botLeftY/boxSize)];
    if (canGo(topLeftIn, botLeftIn)) {
      x = x - speed;
    }
  }
  public void moveRight() {
    turnRight();
    Item topRightIn = grid[(int)((topRightX+speed)/boxSize)][(int)(topRightY/boxSize)];
    Item botRightIn = grid[(int)((botRightX+speed)/boxSize)][(int)(botRightY/boxSize)];
    if (canGo(topRightIn, botRightIn)) {
      x = x + speed;
    }
  }

  public void dropBomb() {
    int xLoc = (int)(centerX/boxSize);
    int yLoc = (int)(centerY/boxSize);
    if (!(grid[xLoc][yLoc] instanceof Bomb)) {
      if (bombsOnField < bombsAllowed) {
        grid[xLoc][yLoc] = new Bomb(xLoc*boxSize, yLoc*boxSize, bombStr, this);
        //this is being called twice on the first bombdrop?!?!?!?!?!#################################################################
        isOnBomb = true;
        bombsOnField = bombsOnField+1;
      }
    }
  }

  public void getHit() {
    health--;
    if (health <= 0) {
      die();
    }
  }

  public void die() {
    isAlive = false;
  }

  public void decreaseBombsOnField() {
    bombsOnField--;
  }
}

private class PlayerA extends Player {
  public PlayerA(float x, float y) {
    super(x, y, "images/PlayerA.png", "A");
  }
}

private class PlayerB extends Player {
  public PlayerB(float x, float y) {
    super(x, y, "images/PlayerB.png", "B");
  }
}

private class PlayerC extends Player {
  public PlayerC(float x, float y) {
    super(x, y, "images/PlayerC.png", "C");
  }
}

private class PlayerD extends Player {
  public PlayerD(float x, float y) {
    super(x, y, "images/PlayerD.png", "D");
  }
}

