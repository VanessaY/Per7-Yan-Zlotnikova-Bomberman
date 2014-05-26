private class box {
  private float x,y,r;
  int toDestroy;
  int hitsTaken;
  color fillColor, strokeColor;
 

  public box(float x, float y, float r) { 
      this.x = x;
      this.y = y;
      this.r = r;
      hitsTaken = 0;
      toDestroy = 3;      
  }
  
  public void display() { 
    fill(162);
    stroke(255);
    rect(x,y,r,r);
  }
}

