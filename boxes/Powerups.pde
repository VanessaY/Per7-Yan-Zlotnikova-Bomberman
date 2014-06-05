//despawn
//transparent when despawn

private class Powerup extends Item{
  float secDespawn;
  int framesToDespawn;
  public Powerup(float x, float y, String img, float secDespawn){
    super(x, y, img);
    this.secDespawn = secDespawn;
    framesToDespawn = (int)secDespawn;
  }
  
  public Powerup(float x, float y, String img){
    this(x, y, img, 1);
  }
  
}

private class SpeedUp extends Powerup{
  public SpeedUp(float x, float y){
    super(x, y, "images/speedup.png");
  }
}

private class HealthUp extends Powerup{
  public HealthUp(float x, float y){
    super(x, y, "images/heart.png");
  }
}

private class StrUp extends Powerup{
  public StrUp(float x, float y){
    super(x, y, "images/syringe.png");
  }
}

private class BombUp extends Powerup{
  public BombUp(float x, float y){
    super(x, y, "images/bombup.png");
  }
}

