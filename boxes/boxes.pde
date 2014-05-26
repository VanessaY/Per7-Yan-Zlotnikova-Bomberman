Item[][] grid;

int cols = 10;
int rows = 10;

void setup() { 
  size(400, 400);
  grid = new Item[cols][rows];
  for (int c=0; c<cols; c++) { 
    for (int r=0; r<rows; r++) { 
      //if (c == 0 || c == 9 || r == 0 || r == 9){
        grid[c][r] = new IndestructibleBox(c*20, r*20);
      //}
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

