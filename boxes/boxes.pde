import java.util.*;
Item[][] grid;

int cols = 10;
int rows = 10;
int boxSize;
PlayerA a;
PlayerB b;
PlayerC c;
PlayerD d;

//PlayerA
boolean wPressed, sPressed, aPressed, dPressed;

void setup() {
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
            grid[c][r] = new PlayerB(c*boxSize, r*boxSize);
            b = (PlayerB)grid[c][r];
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
}

void draw() { 
  background(100);
  for (int c=0; c<cols; c++) { 
    for (int r=0; r<rows; r++) {
      grid[c][r].display();
    }
  }
  
  try{
    a.PDisplay();
  }
  catch (Exception e){}
  try{
    b.PDisplay();
  }
  catch (Exception e){}
  try{
    c.PDisplay();
  }
  catch (Exception e){}
  try{
    d.PDisplay();
  }
  catch (Exception e){}
  
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
  
}
