
public class Asteroid {

  public float xPos, yPos, speed;

  Asteroid(float xPos, float yPos, float speed) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.speed = speed;
  }

  void createAsteroid() {
    noStroke();
    fill(255, 255, 255);
    ellipse(xPos, yPos, 7, 7);
    move();
    difficulty();
  }

  void move() {
    xPos = xPos + speed;
    if (xPos > width) {
      xPos = random(-300, -1000);
      yPos = random(200, height);
    }
  }

  void difficulty() {
    if (score > 100 ) {
      speed = random(3, 5);
      stage = 2;
    } else if (score > 200) {
      speed = random(5, 10);
      stage = 3;
    } else if (score == 500) {
      speed = random(20, 30);
      stage = 4;
    }
  }
}
