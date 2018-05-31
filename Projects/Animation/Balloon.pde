/*
 project3 ( 2 of 3 )
 Author: Camera Finn
 CPSC 120 (Spring 2016), Project 3
 */

class Balloon {
  float x, y, wdth;
  float bdx, sx, sx2;
  float red, green, blue, red2, green2, blue2;
  float speedY, speedSX, speedSX2;

  Balloon() {
    wdth = random(25, 75);
    x = random(wdth, width - wdth);
    y = random (height + 100, 2*height);

    red = random(255);   red2 = random(255);
    green = random(255); green2 = random(255);
    blue = random(255);  blue2 = random(255);
 // Balloon Color        String Color

    speedY = random(-4, -1);
    speedSX = 0.1;
    speedSX2 = 0.1;
    bdx = 19*wdth/120.0;
    sx = x - wdth/10.0;
    sx2 = x + wdth/10.0;
  }

  void displayBalloon() {
    noStroke();
    //beginning of balloon shape
    fill(red, green, blue);
    bezier(x - wdth/2.0, y, 
      x - 7*wdth/12.0, y - 5*wdth/6.0, x + 7*wdth/12.0, y - 5*wdth/6.0, 
      x + wdth/2.0, y);
    // Bezier source: https://processing.org/reference/bezier_.html

    beginShape();
    curveVertex(x - wdth/3.0, y - wdth/30.0); // first control point left
    curveVertex(x - wdth/3.0, y - wdth/30.0); // start point of curve, balloon left side
    curveVertex(x - 299*wdth/600.0, y);
    curveVertex(x - wdth/2.0 + bdx, y + wdth/3.0);
    curveVertex(x, y + 2*wdth/3.0);                 // bottom, middle point of balloon
    curveVertex(x + wdth/2.0 - bdx, y + wdth/3.0);
    curveVertex(x + 299*wdth/600.0, y);
    curveVertex(x + wdth/3.0, y - wdth/30.0);  // last point of curve, balloon right side
    curveVertex(x + wdth/3.0, y - wdth/30.0);  //last control point right
    endShape();    
    triangle(x - 3*wdth/40.0, y + 89*wdth/120.0, x, y + 2*wdth/3.0, 
      x + 3*wdth/40.0, y + 89*wdth/120.0);
    //triangle source: https://processing.org/reference/triangle_.html

    //end of balloon shape

    // spot on balloon
    fill(255, 255, 255, 200);
    ellipse(x + wdth*0.3, y - wdth/4.0, wdth/9.0, wdth/7.0);

    // beginning of string attached to balloon
    beginShape();
    stroke(red2, green2, blue2);
    noFill();
    curveVertex(x, y + 89*wdth/120.0);
    curveVertex(x, y + 89*wdth/120.0);
    curveVertex(sx, y + 149*wdth/120.0);
    curveVertex(sx2, y + 209*wdth/120.0);
    curveVertex(sx, y + 269*wdth/120.0);
    curveVertex(x, y + 329*wdth/120.0);
    curveVertex(x, y + 329*wdth/120.0);
    endShape();
    // end of string attached to balloon
    // beginShape(), curve vertex, and endShape()
    // from Matt Pearson's Generative art, chapter 4, page 75
    // other source: https://processing.org/tutorials/curves/
  }

  void update() {
    y += speedY;
    sx += speedSX;
    sx2 += speedSX2;
    if (y + 3*wdth <= 0) {
      x = random(25, width - 25);
      y = random(height + 100, 2*height);

      red = random(255);     red2 = random(255);
      green = random(255);   green2 = random(255);
      blue = random(255);    blue2 = random(255);
   // Balloon Color          String Color

      wdth = random(25, 75);
      sx = x - wdth/10.0;
      sx2 = x + wdth/10.0;
      bdx = 19*wdth/120.0;
    } else
      y = y + speedY;
    sx2 = sx2 + speedSX2;
    if (sx2 >= x + wdth/10.0) {
      speedSX2 *= -1;
      sx2 = sx2 + speedSX2;
    } else if (sx2 <= x - wdth/10.0) {
      speedSX2 *= -1;
      sx2 = sx2 + speedSX2;
    }
    sx = sx + speedSX;
    if (sx >= x + wdth/10.0) {
      speedSX *= -1;
      sx = sx + speedSX;
    } else if (sx <= x - wdth/10.0) {
      speedSX *= -1;
      sx = sx + speedSX;
    }
  }
}
