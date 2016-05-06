// Here is the class TeddyBear.

class TeddyBear {

// This PVector is used to declare the location of the bear.
  PVector location;
  
// These floats are used to determine the coordinates of the bee's left, right, top, and bottom sides.  
  float LeftX = 0;
  float RightX = 0;
  float UpY = 0;
  float DownY = 0;
  
// The bee takes in 2 parameters.
// These parameters are changed into a PVector.
  TeddyBear(float _x, float _y) {
    location = new PVector(_x, _y);
  }

  // Here are the functions for the class TeddyBear.

  // This method draws a bear according to its location.
  void drawBear(int _x, int _y) {
    location = new PVector(_x, _y);

    // Arms
    stroke(142, 85, 11);
    strokeWeight(5);
    fill(188, 131, 55);
    ellipseMode(CENTER);
    ellipse(location.x - 37, location.y - 13, 30, 50);
    ellipse(location.x + 37, location.y - 13, 30, 50);

    // Legs
    stroke(142, 85, 11);
    strokeWeight(5);
    fill(188, 131, 55);
    ellipseMode(CENTER);
    ellipse(location.x + 20, location.y + 40, 30, 20);
    ellipse(location.x - 20, location.y + 40, 30, 20);

    // Ears
    stroke(142, 85, 11);
    strokeWeight(5);
    fill(188, 131, 55);
    ellipseMode(CENTER);
    ellipse(location.x + 40, location.y - 100, 30, 30);
    ellipse(location.x - 40, location.y - 100, 30, 30);

    // Yellow Patches on Ears
    stroke(255, 231, 149);
    fill(255, 231, 149);
    ellipseMode(CENTER);
    ellipse(location.x + 40, location.y - 100, 10, 10);
    ellipse(location.x - 40, location.y - 100, 10, 10);

    // Body
    stroke(142, 85, 11);
    strokeWeight(5);
    fill(199, 131, 55);
    ellipseMode(CENTER);
    ellipse(location.x, location.y - 10, 80, 90);

    // Yellow Patch
    stroke(255, 231, 149);
    fill(255, 231, 149);
    ellipseMode(CENTER);
    ellipse(location.x, location.y - 10, 50, 60);

    // Head
    stroke(142, 85, 11);
    strokeWeight(5);
    fill(188, 131, 55);
    ellipseMode(CENTER);
    ellipse(location.x, location.y - 70, 90, 80);

    // Eyes
    stroke(0);
    fill(0);
    ellipseMode(CENTER);
    ellipse(location.x - 20, location.y - 70, 7, 7);
    ellipse(location.x + 20, location.y - 70, 7, 7);

    // Mouth Area
    stroke(255, 231, 149);
    strokeWeight(3);
    fill(255, 231, 149);
    ellipseMode(CENTER);
    ellipse(location.x, location.y - 50, 40, 30);

    // Nose
    stroke(142, 85, 11);
    strokeWeight(1);
    fill(0);
    ellipseMode(CENTER);
    ellipse(location.x, location.y - 60, 8, 6);

    // Mouth
    stroke(0);
    line(location.x, location.y - 60, location.x, location.y - 47);
    line(location.x - 7, location.y - 47, location.x + 7, location.y - 47);
  }

// These methods are to determine the coordinates of the bee's sides.
// They each find the sides of the bee: top, right, left, bottom sides.
  float returnLeftX() {
    LeftX = location.x - 52;
    return LeftX;
  }
  float returnRightX() {
    RightX = location.x + 52;
    return RightX;
  }
  float returnUpY() {
    UpY = location.y - 110;
    return UpY;
  }
  float returnDownY() {
    DownY = location.y + 50;
    return DownY;
  }
}

