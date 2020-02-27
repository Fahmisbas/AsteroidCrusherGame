Asteroid[] asteroid;
BadAsteroid[] badAsteroid;
LifeAsteroid[] lifeAsteroid;
MainMenuAsteroid[] mainMenuAsteroid;
Player player;

int stage = 1;
int score = 0;
int life = 3;
PFont font;
PImage gameTitle, saturn, earth;
boolean mainMenu, play;

void setup() {
  size(displayWidth, displayHeight); 
  gameState(true, false);
  
  font = createFont("Helvetica", 16, true);
  
  initAsteroidSize(50, 5);
  initImages();
  initAsteroidObjects(-1,-1500,random(2,3));
  
}

void initImages(){
  saturn = loadImage("src/drawable/Saturn.jpg");
  earth = loadImage("src/drawable/Earth.jpg");
  gameTitle = loadImage("src/drawable/GameTitle.png");
}

void initAsteroidSize(int asteroidSize, int lifeAsteroidSize) {
  asteroid = new Asteroid[asteroidSize];
  badAsteroid = new BadAsteroid[asteroidSize];
  lifeAsteroid = new LifeAsteroid[lifeAsteroidSize];

  player = new Player(asteroid, badAsteroid, lifeAsteroid);
  mainMenuAsteroid = new MainMenuAsteroid[asteroidSize];
}

void initAsteroidObjects(float randomXPosMin, float randomXPosMax,float randomSpeed){
  for (int i=0; i<asteroid.length; i++) {
    asteroid[i] = new Asteroid(random(randomXPosMax, randomXPosMin), random(200, height), randomSpeed); 
    badAsteroid[i] = new BadAsteroid(random(randomXPosMax, randomXPosMin), random(200, height), randomSpeed);
    mainMenuAsteroid[i] = new MainMenuAsteroid(random(randomXPosMax, randomXPosMin), height, 30);
    if (i < lifeAsteroid.length) {
      lifeAsteroid[i] = new LifeAsteroid(random(randomXPosMax, randomXPosMin), random(200, height), randomSpeed);
    }
  }
}

void draw() {
  background(0);

  if (mainMenu && !play) {
    background(0);
    displayingMainMenu();
  } else if (play && !mainMenu) {
    loadGame();
  }
  gameOver();
}

void gameOver() {
  if (life == 0) {
    gameState(false, false);
    background(0);
    fill(255);
    textFont(font, 30);
    text("GAME OVER", width/2-85, height/2);
  }
}

void displayingMainMenu() {
  for (int i=0; i<mainMenuAsteroid.length; i++) {
    mainMenuAsteroid[i].createAsteroid();
  }

  image(gameTitle, width/2-300, height/2-300, 600, 600);

  textFont(font, 30);
  text("Press Enter to Start", width/2-125, height/2+70, 600, 600);
  if (keyCode == ENTER) {
    gameState(false, true);
  }
}

void loadGame() {
  loadBackgroundImages();
  player.createPlayer();
  player.control();
  gameDashboard();

  for (int i=0; i<asteroid.length; i++) {
    asteroid[i].createAsteroid();
    badAsteroid[i].createAsteroid();
    if (i < lifeAsteroid.length) {
      lifeAsteroid[i].createAsteroid();
    }
  }
}

void loadBackgroundImages() {
  image(saturn, width/2, height/2);
  image(earth, 200, 200, 55, 40);
}

void gameDashboard() {
  stroke(255);
  line(0, 195, width, 195);
  line(1100, 0, 1100, 195);
  placeholder();
  playGuide();
  
  displayPoints("SCORE",score,650,100,15);
  displayPoints("LIFE",life,650,115,15);
  displayPoints("STAGE",stage,1130,100,45);
  
}

void playGuide() {
  fill(255);
  textFont(font, 15);
  text("Avoid hitting red Asteroid", 70, 80);
  text("Get the highest score posible!", 70, 105);
  text("Press A,W,S,D Key to control your ship!", 70, 130);
}

void displayPoints(String text, int value,float xPos, float yPos,int fontSize){
  fill(255);
  textFont(font,fontSize);
  text(text + " : " + value,xPos,yPos);
}

void placeholder() {
  rectMode(CENTER);
  stroke(255);
  fill(0);
  rect(200, 100, 300, 100);
  stroke(255);
  fill(0);
  rect(width/2, 100, 200, 50);
}

void gameState(boolean menuState, boolean playState) {
  mainMenu = menuState;
  play = playState;
}
