// Here I am declaring some objects needed for this project.
// There are bees and a bear here in this assignment.
// The theme of this is that the bear has angered the bees, and now must avoid the bees and their wrath.
// (The bear stole their honey, and now the bees are angry.)

TeddyBear Bear;
Bee [] beeCollection = new Bee[100];
Bee beeSpawner;

int count;
int checker;
int realCounter;
int level;
int beeCounter;

boolean gameOver;
boolean clicked;

// The size of the display is 900 by 700.
void setup() {
  size(900, 700);
  smooth();
  restart();
}

// This method was to be placed in setup() in order for the whole thing to work.
// I splitted this up in order to make it look neat, and for certain things to happen.
void restart() {
  count = 1; // This counts how many times the draw() method was called.
  realCounter = 10; // This is the starting point of the timer.
  level = 1; // This keeps track of the level.
  beeCounter = 1; // The number of bees start with one.
  checker = 1; // Checker helps with determining when to start.
  
  gameOver = false; // If gameOver == false, then the game is not over. It will continue until the player loses.
  
  // These two initializes what each variable is assigned to. They keep track of the mouse coordinates.
  int mouseCoordinateX = mouseX;
  int mouseCoordinateY = mouseY; 
  
  // I am creating a new Bee object to mark where the bees spawn.
  beeSpawner = new Bee(50, 50, 0, 0);
  
  // Here, the bear is formed in the middle of the display.
  Bear = new TeddyBear(width/2, height/2);
  
  // For all of the bees in the array beeCollection, they each are assigned random locations and speeds.
  for (int i = 0; i < beeCollection.length; i++) {
    beeCollection[i] = new Bee(int(random(100)), int(random(100)), int(random(1, 5)), int(random(1, 5)));
  }
}

// This method checks if the mouse was clicked.
// It applies one of the following actions if it was clicked or not.
void mouseClicked() {
  if (!clicked) {
    restart(); // If it was clicked, the game was start/restart at level 0.
    clicked = true;
  }
  else {
    clicked = false; // If it wasn't clicked, then nothing will happen.
  }
}

// In this part of the code, it displays the level, the time left, the bear, and the bees.
void draw() {
  
  // If the game is not over, then the draw() method will draw all of the items in this if statement.
  if (!gameOver) {
    background(35, 132, 144); // The background color is assigned here.
    fill(112, 180, 188);
    rect(0, 0, 100, 100); // This rectangle marks the spawner.
    fill(255, 100, 100);
    rect(0, 620, 220, 74); // This rectangle marks the timer and level counter.
    
    // This makes the bee-spawner Bee "flap" its wings.
    beeSpawner.drawBee();
    beeSpawner.wingAngle += beeSpawner.angleChange;

    // This makes sure the bee-spawner Bee's wings reverse the angle change when it reaches the limit.
    if (beeSpawner.wingAngle > beeSpawner.angleLimit || beeSpawner.wingAngle < 0) {
      beeSpawner.angleChange = -beeSpawner.angleChange;
      beeSpawner.wingAngle += beeSpawner.angleChange;
    }
    
    // The coordinates are assigned once again.
    int mouseCoordinateX = mouseX;
    int mouseCoordinateY = mouseY; 
    // This draws the bear where the mouse cursor is at.
    Bear.drawBear(mouseCoordinateX, mouseCoordinateY);

    // Here is the timer.
    count += 1; // Every time the draw() method is called, count increases by 1.
    if (count == 60) { // When count reaches 60, checker increases by 1.
      count = count/60; // The count is then divided by 60. There's approximately 60 calls to draw() in a second.
      checker += 1;     
      if (checker > 1) {
        realCounter -= 1; // The realCounter's value increases by 1 every time a second passes. This keeps track of time.
      }
    }

    if (checker > 1) { // Once checker is greater than 1, the running of the bees occur.
      for (int i = 0; i < beeCounter; i++) {
        beeCollection[i].run();
        beeCollection[i].wingAngle += beeCollection[i].angleChange; // This keeps track of the rotation of the wings.

        // If the wings reach the limit, then it reverses.
        if (beeCollection[i].wingAngle > beeCollection[i].angleLimit || beeCollection[i].wingAngle < 0) {
          beeCollection[i].angleChange = -beeCollection[i].angleChange;
          beeCollection[i].wingAngle += beeCollection[i].angleChange;
        }
      }

      // All of the text-related methods just place text on the display.
      textSize(18);
      fill(142, 242, 142);
      text("There are 10 levels. Can you reach Level 10?", 500, 660);
      text("Avoid the bees!", 750, 20);

      textSize(14);
      fill(230, 34, 85);
      text("Bee Spawner", 7, 80);

      textSize(32); 
      fill(255, 166, 82);
      text("Level " + level, 10, 650);
      text("Time left: " + realCounter, 10, 690);

      // Whenever the timer reaches 0, the number of bees running increases by 1.
      if (realCounter == 0) {
        beeCounter += 1;
        realCounter = 10; // The timer is then changed to 10 again.
        level += 1; // The level also increases.
      }
  
      // If the player reaches level 11, then the game is over, and the player won.
      if (level == 11) {
        gameOver = true;
        background(100, 100, 100);
        textSize(110);
        fill(255, 0, 255);
        text("WINNER!", 200, 300);
      }

      // This keeps track of whether the player had lost.
      for (int i = 0; i < beeCounter; i++) {
        if ((beeCollection[i].returnLeftX() < Bear.returnRightX())&& // All of these comparisons check if the bear
          (beeCollection[i].returnRightX() > Bear.returnLeftX()) &&  // touches the bee.
          (beeCollection[i].returnUpY() < Bear.returnDownY()) &&
          (beeCollection[i].returnDownY() > Bear.returnUpY())) {
          gameOver = true; // If the bear comes into contact with any of the bee, then the player loses.
          background(0);
          textSize(100); 
          fill(255, 0, 0);
          text("GAME OVER", 200, 300);
          textSize(50);
          text("Click to try again.", 270, 500);
          text("Level reached: " + level, 270, 550);
          text("Number of bees: " + beeCounter, 270, 600);
        }
      }
    }
  }
}

