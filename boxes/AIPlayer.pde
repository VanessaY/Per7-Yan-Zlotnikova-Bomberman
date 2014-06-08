import java.io.*;
import java.util.*;

//#1 priority - hiding from bombs
//#2 priority - getting powerups

private class AIPlayer extends Player {
  PriorityQueue<int[]> p = new PriorityQueue();
   
  /*
  public AIPlayer(float x, float y, String filename,
                int bombStr, int bombsOnField, int bombsAllowed, 
                int health, int speed, String displayImg){
      super(x, y, filename, bombStr, bombsOnField, bombsAllowed, health, speed, displayImg);
   }
   public AIPlayer(float x, float y, String filename){
      super(x, y, filename, 2, 0, 1, 2, 2, "images/empty.png");
  }
  */
  public AIPlayer(float x, float y){
    super(x, y, "images/PlayerB.png");
  }
  
  public void stay() {
  }
  
  public void escape() { 
    if (!atRiskOfDeath()) { 
      System.out.println("safe");
    }
    else { 
      System.out.println("not safe");
      escapeFromDeath((int)centerX/boxSize, (int)centerY/boxSize);
    }
  }



public void moveDown() { 
   int xCor = (int)centerX/boxSize;
   int yCor = (int)(centerY/boxSize)+1;
   if (yCor <= 8 && yCor >= 0) { 
     if (!(grid[xCor][yCor] instanceof Box) && !(grid[xCor][yCor] instanceof Bomb) && !(grid[xCor][yCor] instanceof Fire)) { 
       while (centerY < (yCor)*50) {
         y = y + speed;
         centerY = centerY + speed;
       }
     }
  }
}

public void moveRight() { 
   int xCor = (int)(centerX/boxSize)+1;
   int yCor = (int)centerY/boxSize;
   if (xCor <= 8 && xCor >= 0) { 
     if (!(grid[xCor][yCor] instanceof Box) && !(grid[xCor][yCor] instanceof Bomb) && !(grid[xCor][yCor] instanceof Fire)) { 
       while (centerX < (xCor)*50) {
         x = x + speed;
         centerX = centerX + speed;
       }
     }
  }
}



public void moveLeft() { 
   int xCor = (int)(centerX/boxSize)-1; 
    int yCor = (int)centerY/boxSize;
   if (xCor <= 8 && xCor >= 0) {  
     if (!(grid[xCor][yCor] instanceof Box) && !(grid[xCor][yCor] instanceof Bomb) && !(grid[xCor][yCor] instanceof Fire)) { 
       while (centerX > (xCor)*50) {
          x = x - speed;
         centerX = centerX - speed;
       }
     }
  }
}

public void moveUp() { 
   int yCor = (int)(centerY/boxSize)-1;
   int xCor = (int)centerX/boxSize;
   if (yCor <= 8 && yCor >= 0) { 
     if (!(grid[xCor][yCor] instanceof Box) && !(grid[xCor][yCor] instanceof Bomb) && !(grid[xCor][yCor] instanceof Fire)) { 
       while (centerY > (yCor)*50) {
         y = y + speed;
         centerY = centerY + speed;
       }
     }
  }
}



  public void escapeFromDeath(int x, int y) { 
    if (atRiskOfDeath()) { 
      moveDown();  
      if (atRiskOfDeath()) { 
        moveUp();
        escapeFromDeath(((int)centerX/boxSize),
                         ((int)centerY/boxSize));
      }
      if (atRiskOfDeath()) { 
        moveRight();
        escapeFromDeath(((int)centerX/boxSize),
                         ((int)centerY/boxSize));
      }
      if (atRiskOfDeath()) { 
         moveLeft();
        escapeFromDeath(((int)centerX/boxSize),
                         ((int)centerY/boxSize));
      }
      if (atRiskOfDeath()) { 
        removeSelf();
      }
    }
  }

  public boolean atRiskOfDeath() { //checks if theres a bomb that could kill it
    int xCor = (int)(centerX/boxSize);
    int yCor = (int)(centerY/boxSize);
    //ArrayList<Bomb> bombs = new ArrayList<Bomb>(); //all bombs on grid
    //ArrayList<int[]> fires = new ArrayList<int[]>(); //locations of where fires will be
  
     for (int r=0; r<grid.length; r++) { 
        for (int c=0; c<grid[0].length; c++)  {
          if (grid[c][r] instanceof Bomb) {
              Bomb b = (Bomb)grid[c][r];
              ArrayList<int[]> al = b.explodeLocs();
              for (int i=0; i<al.size(); i++) {
                if (al.get(i)[0] == xCor && al.get(i)[1]== yCor) { 
                  System.out.println("yup");
                  return true;
                }
              }
          }
        }
     }
   System.out.println("nope");
   return false;
  }
}

