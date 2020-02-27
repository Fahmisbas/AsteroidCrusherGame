
class MainMenuAsteroid extends Asteroid {

  private PImage asteroid;

  MainMenuAsteroid(float xPos, float yPos, float speed) {
    super(xPos, yPos, speed);
    asteroid = loadImage("src/drawable/Line.png");
  }

  @Override
    void createAsteroid() {
    image(asteroid, xPos, yPos, random(10, 15), 1);
    move();
  }

  @Override
    void move() {
    xPos = xPos + speed;
    if (xPos > width) {
      xPos = random(-300, -1000);
      yPos = random(height);
    }
  }
}
