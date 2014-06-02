import java.util.*;
Item[][] grid;

int cols = 10;
int rows = 10;

void setup() {
  size(500, 500);
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
            grid[c][r] = new Item(c*50, r*50);
          }
          else if (ch.equals("x")){
            grid[c][r] = new IndestructibleBox(c*50, r*50);
          }
          else if (ch.equals("1")){
            grid[c][r] = new DestructibleBox(c*50, r*50);
          }  
          else if (ch.equals("b")) {
            grid[c][r] = new Bomb(c*50, r*50, 2, 2);
          }
        }
      }
      catch(Exception e){
      }
    }
  }
  catch(Exception e){
  }
  ((Bomb)grid[8][1]).explode();
  ((Bomb)grid[4][5]).explode();
}

void draw() { 
  background(100);
  for (int c=0; c<cols; c++) { 
    for (int r=0; r<rows; r++) {
      grid[c][r].display();
    }
  }
}
