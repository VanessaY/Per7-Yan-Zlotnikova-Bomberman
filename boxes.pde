box[][] grid;

int cols = 10;
int rows = 10;

void setup() { 
  size(400, 400);
  grid = new box[cols][rows];
  for (int c=0; c<cols; c++) { 
    for (int r=0; r<rows; r++) { 
      grid[c][r] = new box(c*20, r*20, 20);
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

