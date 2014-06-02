import java.util.*;
Item[][] grid;

int cols = 10;
int rows = 10;
int boxSize;

void setup() {
  boxSize = 30;
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
          }
          else if (ch.equals("b")){
            grid[c][r] = new PlayerB(c*boxSize, r*boxSize);
          }
          else if (ch.equals("c")){
            grid[c][r] = new PlayerC(c*boxSize, r*boxSize);
          }
          else if (ch.equals("d")){
            grid[c][r] = new PlayerD(c*boxSize, r*boxSize);
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

void draw() { 
  background(100);
  for (int c=0; c<cols; c++) { 
    for (int r=0; r<rows; r++) {
      grid[c][r].display();
      if (grid[c][r] instanceof Player){
        ((Player)grid[c][r]).PDisplay();
      }
    }
  }
}
