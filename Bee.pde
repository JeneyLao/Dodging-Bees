// Here is the class Bee.

class Bee {

// These two PVectors are used to declare the location and speed of each bee.
  PVector location;
  PVector speed;

// These floats are used to determine the coordinates of the bee's left, right, top, and bottom sides.
  float LeftX = 0;
  float RightX = 0;
  float UpY = 0;
  float DownY = 0;
  
// These ints are used to determine how much the wings should rotate and when they should stop and reverse.
  int wingAngle = 0;
  int angleChange = 10;
  final int angleLimit = 100;

// The bee takes in 4 parameters.
// The first two are the location of the bee.
// The last two are the speed of the bee.
// These parameters are changed into PVectors.
  Bee(float _x, float _y, float _speedX, float _speedY) {
    location = new PVector(_x, _y);
    speed = new PVector(_speedX, _speedY);
  }
  
  // This method draws a bee.
  void drawBee() {

    // Wings
    stroke(0);
    strokeWeight(1);
    fill(255);
    
    // Rotation of right wing
    pushMatrix();
    translate(location.x + 10, location.y - 7);
    rotate(radians(wingAngle));
    ellipse(0, 0, 15, 30);
    popMatrix();
    
    // Rotation of left wing
    pushMatrix();
    translate(location.x - 10, location.y - 7);
    rotate(radians(-wingAngle));
    ellipse(0, 0, 15, 30);
    popMatrix();

    // Body
    stroke(0);
    strokeWeight(3);
    fill(255, 255, 0);
    ellipse(location.x, location.y, 30, 30);

    // Stripes
    stroke(0);
    line(location.x - 12, location.y, location.x + 12, location.y);
    line(location.x - 11, location.y + 7, location.x + 11, location.y + 7);

    // Eyes
    stroke(0);
    fill(0);
    ellipse(location.x - 5, location.y - 7, 1, 1);
    ellipse(location.x + 5, location.y - 7, 1, 1);
  }

// Right here, this method determines how much a bee should move in order to follow the coordinates of the mouse.
// This implies that the bear releases pheromones which attracts the bees. It makes it harder for the player to win.
  void move() {
    if (location.x < Bear.location.x){
      location.x = location.x + 5; // If the bear's location's x coordinate is greater than the bee's, then the bee will
    }                              // try to advance towards the bear faster.
    if (location.x > Bear.location.x){
      location.x = location.x - 5; // If the bear's location's x coordinate is less than the bee's, then the bee will
      speed.x = -speed.x;          // lower its speed in order to advance towards the bear. The speed is negated to head the other direction.
    }
    if (location.y < Bear.location.y){
      location.y = location.y + 5; // Similar definitions from above apply here. If the bee's y coordinate is less than
    }                              // the bear's y coordinate, then the bee's speed will increase in order to catch up to the bear.
    if (location.y > Bear.location.y){
      location.y = location.y - 5; // If the bee's y coordinate is greater than the bear's y coordinate, then the bee will lower
      speed.y = -speed.y;          // its speed and head towards the bear. The speed is negated in order to head in the other direction.
    }
    location.add(speed); // The bee moves according to its speed.
  }

// If the bee gets close to the walls of the display, then it will bounce back.
// These 4 if statements check that; each statement is for each side.
  void bounce() {
    if (location.x > width) {
      speed.x = speed.x * -1;
    }
    if (location.x < 0) {
      speed.x = speed.x * -1;
    }
    if (location.y > height) {
      speed.y = speed.y * -1;
    }
    if (location.y < 0) {
      speed.y = speed.y * -1;
    }
  }

// These methods are to determine the coordinates of the bee's sides.
// They each find the sides of the bee: top, right, left, bottom sides.
  float returnLeftX() {
    LeftX = location.x - 15;
    return LeftX;
  }
  float returnRightX() {
    RightX = location.x + 15;
    return RightX;
  }
  float returnUpY() {
    UpY = location.y - 15;
    return UpY;
  }
  float returnDownY() {
    DownY = location.y + 15;
    return DownY;
  }

// All of these methods are combined into one in this method.
  void run() {
    drawBee();
    move();
    bounce();
  }
}

