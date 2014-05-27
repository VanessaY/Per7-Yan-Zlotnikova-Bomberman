Item[][] grid;

int cols = 10;
int rows = 10;

void setup() { 
  size(500, 500);
  grid = new Item[cols][rows];
  for (int c=0; c<cols; c++) { 
    for (int r=0; r<rows; r++) { 
      if (c == 0 || c == 9 || r == 0 || r == 9){
        grid[c][r] = new IndestructibleBox(c*50, r*50);
      }
      /*
      else if ((c == 3 || c == 6) && (r == 3 || r == 6)){
        grid[c][r] = new IndestructibleBox(c*50, r*50);
      }
      else if ((c == 1 || c == 8) && (r == 1 || r == 8)){
        grid[c][r] = new Item(c*50, r*50);
      }
      */
      else{
        grid[c][r] = new DestructibleBox(c*50, r*50);
      }
      
    }
  }
}

void draw() { 
  for (int c=0; c<cols; c++) { 
    for (int r=0; r<rows; r++) { 
      grid[c][r].display();
    }
  }
}

