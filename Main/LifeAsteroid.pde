
class LifeAsteroid extends Asteroid {

  LifeAsteroid(float xPos, float yPos, float speed) {
    super(xPos, yPos, speed);
  }

  @Override
    void createAsteroid() {
    fill(#03FA00);
    noStroke();
    rect(xPos, yPos, 8, 8);
    super.move();
    super.difficulty();
  }
}
