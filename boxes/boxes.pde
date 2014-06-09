//movements for players b, c, d
//ghetto mode

import java.util.*;
Item[][] grid;

int cols = 10;
int rows = 10;
int boxSize;
int framerate;
PlayerA a;
PlayerB b;
PlayerC c;
PlayerD d;
AIPlayer AI;

//PlayerA
boolean wPressed, sPressed, aPressed, dPressed, shiftPressed;

//player b
boolean upPressed, downPressed, leftPressed, rightPressed, spacePressed;

void setup() {
  framerate = 120;
  frameRate(120);
  boxSize = 50;
  size(boxSize*10, boxSize*10);
  background(100);
  grid = new Item[cols][rows];
  try{
    BufferedReader reader = createReader("map1.txt");
    for (int r = 0; r < rows; r++){
      try{
        String line = reader.readLine();
        for (int c = 0; c < line.length(); c++){
          String ch = line.substring(c, c+1);
          if (ch.equals(" ")){
            grid[c][r] = new Item(c*boxSize, r*boxSize);
          }
          else if (ch.equals("x")){
            grid[c][r] = new IndestructibleBox(c*boxSize, r*boxSize);
          }
          else if (ch.equals("1")){
            grid[c][r] = new DestructibleBox(c*boxSize, r*boxSize);
          }
          else if (ch.equals("a")){
            grid[c][r] = new PlayerA(c*boxSize, r*boxSize);
            a = (PlayerA)grid[c][r];
          }
          else if (ch.equals("b")){
            /*
            grid[c][r] = new PlayerB(c*boxSize, r*boxSize);
            b = (PlayerB)grid[c][r];
            */
            grid[c][r] = new AIPlayer(c*boxSize, r*boxSize);
            AI = (AIPlayer)grid[c][r];
          }
          else if (ch.equals("c")){
            grid[c][r] = new PlayerC(c*boxSize, r*boxSize);
          }
          else if (ch.equals("d")){
            grid[c][r] = new PlayerD(c*boxSize, r*boxSize);
            d = (PlayerD)grid[c][r];
          }
        }
      }
      catch(Exception e){
      }
    }
  }
  catch(Exception e){
  }
}

void keyPressed(){
  if (key == 'w'){
    wPressed = true;
  }
  else if (key == 'a'){
    aPressed = true;
  }
  else if (key == 's'){
    sPressed = true;
  }
  else if (key == 'd'){
    dPressed = true;
  }
  else if (key == ' '){
    spacePressed = true;
  }
  else if (key == CODED){
    if (keyCode == SHIFT){
      shiftPressed = true;
    }
    else if (keyCode == UP){
      upPressed = true;
    }
    else if (keyCode == DOWN){
      downPressed = true;
    }
    else if (keyCode == LEFT){
      leftPressed = true;
    }
    else if (keyCode == RIGHT){
      rightPressed = true;
    }
  }
}

void keyReleased(){
  if (key == 'w'){
    wPressed = false;
  }
  else if (key == 'a'){
    aPressed = false;
  }
  else if (key == 's'){
    sPressed = false;
  }
  else if (key == 'd'){
    dPressed = false;
  }
  else if (key == ' '){
    spacePressed = false;
  }
  else if (key == CODED){
    if (keyCode == SHIFT){
      shiftPressed = false;
    }
    else if (keyCode == UP){
      upPressed = false;
    }
    else if (keyCode == DOWN){
      downPressed = false;
    }
    else if (keyCode == LEFT){
      leftPressed = false;
    }
    else if (keyCode == RIGHT){
      rightPressed = false;
    }
  }
}

void draw() { 
  background(100);
  for (int c=0; c<cols; c++) { 
    for (int r=0; r<rows; r++) {
      Item obj = grid[c][r];
      obj.display();
      if (obj instanceof Bomb){
        ((Bomb)obj).countDown();
      }
      else if (obj instanceof Fire){
        ((Fire)obj).countDown();
      }
      else if (obj instanceof Powerup){
        ((Powerup)obj).countDown();
      }
    }
  }
  try { 
    AI.PDisplay();
    if(!(AI.isAlive)) { 
      AI = null;
    }
  }
  catch (Exception e){} 
  try{
    a.PDisplay();
    AI.act();
    if (!(a.isAlive)){
      a = null;
    }
  }
  catch (Exception e){}
  try{
    b.PDisplay();
    if (!(b.isAlive)){
      b = null;
    }
  }
  catch (Exception e){}
  try{
    c.PDisplay();
    if (!(c.isAlive)){
      c = null;
    }
  }
  catch (Exception e){}
  try{
    d.PDisplay();
    if (!(d.isAlive)){
      d = null;
    }
  }
  catch (Exception e){
  }
  
  //Player A
  if (wPressed){
    try{
      a.moveUp();
    }
    catch (Exception e){
    }
  }
  if (aPressed){
    try{
      a.moveLeft();
    }
    catch (Exception e){
    }
  }
  if (sPressed){
    try{
      a.moveDown();
    }
    catch (Exception e){
    }
  }
  if (dPressed){
    try{
      a.moveRight();
    }
    catch (Exception e){
    }
  }
  if (shiftPressed){
    try{
      a.dropBomb();
    }
    catch (Exception E){
    }
  }
  
  //PlayerB
  if (upPressed){
    try{
      b.moveUp();
    }
    catch (Exception e){
    }
  }
  if (leftPressed){
    try{
      b.moveLeft();
    }
    catch (Exception e){
    }
  }
  if (downPressed){
    try{
      b.moveDown();
    }
    catch (Exception e){
    }
  }
  if (rightPressed){
    try{
      b.moveRight();
    }
    catch (Exception e){
    }
  }
  if (spacePressed){
    try{
      b.dropBomb();
    }
    catch (Exception E){
    }
  }
}
