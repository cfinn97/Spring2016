/*
 project3 ( 3 of 3 )
 Author: Camera Finn
 CPSC 120 (Spring 2016), Project 3
 */

class Ball {
  int cx, cy; // coordinates of ball position
  float diam; // ball diameter
  float dx, dy;
  float r, g, b, r2, g2, b2, r3, g3, b3;

  Ball(int x, int y) {
    this. cx = x;
    this. cy = y;
    diam = random(50, 100);

    r = random(255);     r2 = random(255);  r3 = random(255);
    g = random(255);     g2 = random(255);  g3 = random(255);
    b = random(255);     b2 = random(255);  b3 = random(255);
    dx = random(-10, 10);
    dy = random(-10, 10);
  }

  void displayBall() {
    Ballz(4, this.cx, this.cy, this.diam);
  }

  void circle(float x, float y, float D) {
    noStroke();
    ellipse(x, y, D, D);
  }

  void Ballz(int _level, float cx, float cy, float d) {
    // recursive
    if (_level == 2) {
      fill(r2, g2, b2);
    }
    if (_level == 3) {
      fill(r3, g3, b3);
    }
    if (_level == 4) {
      fill(r, g2, b3);
    }
    if (_level == 1) {
      fill (r, g, b);
      circle(cx, cy, d);
    } else {
      circle(cx, cy, d);
      Ballz(_level - 1, cx, cy, d/2);
    }
  }

  void update() {
    cx += dx;
    cy += dy;

    if (cx >= width + diam/2) {
      cx = -(int)diam/2;
      cx += dx;
    }
    // disappear from right side of window and reappear at left of window
    if (cx <= - diam/2) {
      cx = width + (int)diam/2;
      cx += dx;
    }
    // disappear from left side of window and reappear at right of window
    if (cy >= height + diam/2) { 
      cy = -(int)diam/2;
      cy += dy;
    }
    // disappear from bottom of window and reappear at top of window
    if (cy <= -diam/2) {
      cy = height + (int)diam/2;
      cy += dy;
    }
    // disappear from top of window and reappear at bottom of window
    for (int i = 0; i < ball.length; i++) {
      Ball Blls = ball[i];
      if (Blls != this) {
        // detecting other ball objects
        // bounce off of other balls
        // however, still can't prevent balls from getting stuck/fozen due to being too close
        // I checked with you and you said that it was ok
        if(dist(cx, cy, Blls.cx, Blls.cy) <= diam/2 + Blls.diam/2) {
          // emergance
          dy *= -1;
          cy += dy*2;
          dx *= -1;
          cx += dx*2;
        }
      }
    }
  }
}
