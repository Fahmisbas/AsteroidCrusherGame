

class Player {

  float xPos, yPos, playerSpeed;
  Asteroid[] asteroid;
  BadAsteroid[] badAsteroid;
  LifeAsteroid[] lifeAsteroid;

  Player(Asteroid[] asteroid, BadAsteroid[] badAsteroid, LifeAsteroid[] lifeAsteroid) {

    xPos = 1260;
    yPos = 500;
    playerSpeed = 5;

    this.asteroid = asteroid;
    this.badAsteroid = badAsteroid;
    this.lifeAsteroid = lifeAsteroid;
  }

  void createPlayer() {
    fill(#444376);
    rect(xPos, yPos, 25, 8);
    hitAsteroids();
  }
  
   void control() {
    if (keyPressed && key == 'a' || key == 'A') {
      xPos = xPos - playerSpeed;
    } else if (keyPressed && key == 'd' || key == 'D') {
      xPos = xPos + playerSpeed;
    } else if (keyPressed && key == 's' || key == 'S') {
      yPos = yPos + playerSpeed;
    } else if (keyPressed && key == 'w' || key == 'W') {
      yPos = yPos - playerSpeed;
    }
    if (yPos == 200) {
      yPos = 750;
    } else if (yPos == 750) {
      yPos = 200;
    }
  }

  void hitAsteroids() {
    for (Asteroid roid : asteroid) {
      if (dist(roid.xPos, roid.yPos, xPos, yPos) <= 10) {
        background(255);
        roid.xPos = width+100;
        score++;
      }
    }

    for (BadAsteroid badroid : badAsteroid) {
      if (dist(badroid.xPos, badroid.yPos, xPos, yPos) <= 10) {
        background(255, 5, 5);
        badroid.xPos = width+100;
        life--;
      }
    }

    for (LifeAsteroid liferoid : lifeAsteroid) {
      if (dist(liferoid.xPos, liferoid.yPos, xPos, yPos) <= 10) {
        background(#03FA00);
        liferoid.xPos = width+100;
        life++;
      }
    }
  }
}
