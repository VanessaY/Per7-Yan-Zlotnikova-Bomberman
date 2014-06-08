import java.io.*;
import java.util.*;

//#1 priority - hiding from bombs
//#2 priority - getting powerups

private class AIPlayer extends Player {
  int allBombs; //total # of bombs on screen
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
    escapeFromDeath((int)centerX/boxSize, (int)centerY/boxSize);
  }
  
  public void escapeFromDeath(int x, int y) { 
    if (atRiskOfDeath()) { 
        moveUp();
        escapeFromDeath(((int)centerX/boxSize),
                         ((int)centerX/boxSize));
        moveDown();
        escapeFromDeath(((int)centerX/boxSize),
                         ((int)centerX/boxSize));
        moveRight();
        escapeFromDeath(((int)centerX/boxSize),
                         ((int)centerX/boxSize));
        moveDown();
        escapeFromDeath(((int)centerX/boxSize),
                         ((int)centerX/boxSize));
        if(atRiskOfDeath()) {
          stay();
        }
    }
  }
    
  
  public void allBombsOnScreen() { 
    for (int r=0; r<grid.length; r++) { 
      for (int c=0; c<grid[0].length; c++)  {
        if (grid[c][r] instanceof Bomb) { 
          allBombs++;
        }
      }
    }
  }
  
  public boolean atRiskOfDeath() { //checks if theres a bomb that could kill it
  int xCor = (int)(centerX/boxSize);
  int yCor = (int)(centerY/boxSize);
  ArrayList<Bomb> bombs = new ArrayList<Bomb>(); //all bombs on grid
  ArrayList<int[]> fires = new ArrayList<int[]>(); //locations of where fires will be
  
   for (int r=0; r<grid.length; r++) { 
      for (int c=0; c<grid[0].length; c++)  {
        if (grid[c][r] instanceof Bomb) {
            bombs.add((Bomb)(grid[c][r]));
        }
      }
   }
   for (int i=0; i<bombs.size(); i++) { 
     Bomb b = bombs.get(i);
     for (int j=0; j<b.explodeLocs().size(); j++) { 
       fires.add(b.explodeLocs().get(j));
     }
   }
   for (int i=0; i<fires.size(); i++) { 
     if ((fires.get(i))[0] == xCor && (fires.get(i))[1] == yCor) { 
       return true;
     }
   }
   return false;
  }
  
  
  
  
}
