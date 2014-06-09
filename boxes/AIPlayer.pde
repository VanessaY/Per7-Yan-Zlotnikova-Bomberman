import java.io.*;
import java.util.*;

//#1 priority - hiding from bombs
//#2 priority - getting powerups

private class AIPlayer extends Player {
  PriorityQueue<int[]> p = new PriorityQueue();
  boolean canDropYet;
  int secToWait;
  int framestowait; 
  int len = 0; //length of path;
   
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
    secToWait = 2;
    framestowait = secToWait*framerate;
  }
  
  public void PDisplay(){
      super.PDisplay();
      if (framestowait == 0)
          canDropYet = true;
      else
          framestowait--;
  }
          
  
  public void stay() {
  }
  
  


public void moveDown() { 
   int xCor = (int)centerX/boxSize;
   int yCor = (int)(centerY/boxSize)+1;
   if (yCor <= 8 && yCor >= 0) { 
     if (!(grid[xCor][yCor] instanceof Box) && !(grid[xCor][yCor] instanceof Bomb) && !(grid[xCor][yCor] instanceof Fire)) { 
       while ((int)centerY/boxSize < yCor) {
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
       while (((int)centerX/boxSize)< xCor) {
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
       while (((int)centerX/boxSize)> xCor) { 
          x = x- speed; 
          centerX = x - speed;
        }
     }
  }
}

public void moveUp() { 
   int yCor = (int)(centerY/boxSize)-1;
   int xCor = (int)centerX/boxSize;
   if (yCor <= 8 && yCor >= 0) { 
     if (!(grid[xCor][yCor] instanceof Box) && !(grid[xCor][yCor] instanceof Bomb) && !(grid[xCor][yCor] instanceof Fire)) { 
       while ((int)(centerY/boxSize)> yCor) {
         y = y + speed;
         centerY = centerY + speed;
       }
     }
  }
}



  public void escape() { 
    if (atRiskOfDeath()) { 
      moveUp();
      if (atRiskOfDeath()) { 
        moveDown();
        moveDown();
      }
      if (atRiskOfDeath()) { 
        moveUp();
        moveRight();
      }
      if (atRiskOfDeath()) { 
        moveLeft();
        moveLeft();
      }
      if (atRiskOfDeath()) { 
        isAlive = false;
        return;
      }
    }
  }
  

  
  public void act() { 
     escape();
     double random = Math.random() * 49;
     if (canDropYet==true){
       if (random<5) 
         dropBombHelper();
     }
  }
    
    
  public void dropBombHelper() {
    dropBomb();
    //escape();
  }

  public boolean atRiskOfDeath() { //checks if theres a bomb that could kill it
                               // not at risk
                               //1 = safe loc on top 
                               // 2 = safe loc on bottom
                               // 3 = safe loc on left
                               // 4 = safe loc on right
                               // 5 = commit suicide
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
                if (al.get(i)[0] == xCor && al.get(i)[1]== yCor) { //it is at risk of death
                 
               /* l = new int[]{xCor+1,yCor};
                   if (!(al.contains(l))) { 
                     if (xCor+1<10) { 
                       if (!(grid[xCor+1][yCor] instanceof Box))
                         return 4;
                     }
                   }
                   l = new int[]{xCor-1,yCor};
                   if (!(al.contains(l))) { 
                     if (xCor-1>0) { 
                       if (!(grid[xCor-1][yCor] instanceof Box))
                        return 3;
                     }
                   }
                   l = new int[]{xCor,yCor+1};
                   if (!(al.contains(l))){ 
                     if (yCor+1<10) { 
                       if (!(grid[xCor][yCor+1] instanceof Box))
                         return 1;
                     }
                   }
                   l = new int[]{xCor,yCor-1};
                    if (!(al.contains(l))) { 
                      if (yCor-1>10) { 
                       if (!(grid[xCor][yCor-1] instanceof Box)){
                         System.out.println("werK");
                        return 2;
                       }
                      }
                     
                    }
                    */
                    return true;
                }
              }
          }
        }
     }
     return false; 
  }
}
