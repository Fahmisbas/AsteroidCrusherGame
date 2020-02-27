
class BadAsteroid extends Asteroid {

  BadAsteroid(float xPos, float yPos, float speed) {
    super(xPos, yPos, speed);
  }

  @Override
    void createAsteroid() {
    noStroke();
    fill(255, 5, 5);
    ellipse(xPos, yPos, 5, 5);
    super.move();
    super.difficulty();
  }
}
