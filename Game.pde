/*
   Game ( < 1 > of < 1 > )
   Author: Camera Finn
   CPSC 120, Project 1
   Created:  < March 3, 2016 > 
*/
PFont f; // font
int r, g, b;
int score; //score
float x = 350, y = 475;
      // coordinates of the circular container
boolean running;
PShape top;    //Name of white rectangle behind score

class Box {    // class for circular container (ball)
  float r2, g2, b2;
  color c2;

  Box() {
    r2 = random(255);
    g2 = random(255);
    b2 = random(255);
    c2 = color(r2, g2, b2);
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    noStroke();
    fill (c2);
    rectMode(CENTER); rect(x, y, 100, 50);
  }

  boolean intersect(Bubble b) {
    if (b.yb > y + 25 && b.xb < x + 50 && b.xb > x - 50){
      return true;}
      else 
      return false; 
    
  }
}// end of class of Box 

class Bubble {          // class for Bubbles
  float r1, g1, b1;
  float r, yb, xb;
  float speed;          // speed of bubble
  color c1;             // color of bubble

  Bubble () {
    r = 10;    // All bubles are same size
    xb = random(10, width-10);  yb = -r*4;
        //coordinates of each bubble
    
    r1 = random(255);
    g1 = random(255);
    b1 = random(255);
    
    speed = random(1, 5);   // pick a random speed
    c1 = color(r1, g1, b1); // color code for each bubble
  }
  
  void move() {             //speed of bubbles
    yb += speed;
  }

  boolean reachedBottom() {
         //What happens to a bubble when pass the
         //bottom of window 
    if (yb > height + r*4) {
      return true;
    } else {
      return false;
    }
  }

  void display() {  // how each bubble will be displayed
    fill(c1);
    noStroke();
    ellipse(xb, yb, r*2, r*2);
  }
  void caught() { // bubble leaves window if caught by ball
    speed = 0;
    yb = -1000;
  }
} // end class bubble

class Timer {
  int savedTime; // when Timer started
  int totalTime; // how long timer should last

  Timer (int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
              // When the timer starts it stores the
              //current time in milliseconds.
  } // end start method

  boolean isFinished() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } else { 
      return false;
    }
  }
} // end class timer

Box box;
Timer timer;                 //one timer object
Bubble[] bubbles;            // an array of bubble objects
int totalBubbles = 0;        // totalBubbles

void setup() {
  size(700, 500);
  r = 255;
  g = 255;
  b = 255;

  top = createShape(RECT, -100, -50, 200, 100);
        // create the rectangle
  top.setStroke(color(255));
      //stroke color of rectangle
  top.setFill(color(255, 150)); 
      // fill color of rectangle: white with some
          //transparency

  f = createFont("Arial", 30, true);
      // Arial, 16 point, anti-aliasing on
  textFont(f, 30);
  textAlign(CENTER);  //center of text = x, y corrdinates

  score = 0;      //initial score is 0 at start of game
  text("Score: " + score, width/2, 40);
        // location of text and whords displayed

  bubbles = new Bubble[1000];
            //create 1000 spots in the array
  box = new Box();
            // one ball object
  timer = new Timer(500);
            // create a timer tha goes off every 
            //3000 milliseconds
  timer.start();
} // end setup

void draw() {
  background(r, g, b);

  if (timer.isFinished()) {
    bubbles[totalBubbles] = new Bubble();
    totalBubbles ++ ;
    if (totalBubbles >= bubbles.length) {
    }

    timer.start();
  }

  for (int i = 0; i < totalBubbles; i++ ) {
    bubbles[i].move();        //move baubbles
    bubbles[i].display();      //displayes bubbles

    box.setLocation(x, y);
    box.display();         // displays ball, so ball is seen

    shape(top, 350, 25);
          // display white reactangle behind score
    text("Score: " + score, width/2, 40);

    if (box.intersect(bubbles[i])) {
      bubbles[i].caught();
      score = score + 1;
    }
  }
} // end draw

void keyPressed() {
  if (key == CODED) { 
    if (keyCode == LEFT) { 
            // move ball left in x-direction
      if (x <= -50) {
        x = width + 50;
        x = x - 15;
      } else if (x > -50) {
        x = x - 15;
      }
    }
    if (keyCode == RIGHT) {
            // move ball right in x-direction
      if (x >= width + 50) {
        x = -50;
        x = x + 15;
      } else if (x < width + 50) {
        x = x + 15;
      }
    }
  }
  if (key == 'p') {    //Freezerestore animation
    if (running) {
      noLoop();
      running = false;
    } else if (running == false) {
      loop();
      running = true;
    }
  }
  if (key == ' ') {
    setup();          // reset animation
    totalBubbles = 0;
  }
  switch(key) {
  case 'R': 
    { 
      r = r + 10; 
      if (r > 255) {
        r = 255;
      }
      break;
    }
  case 'G': 
    { 
      g = g + 10; 
      if (g > 255) {
        g = 255;
      }
      break;
    }
  case 'B': 
    { 
      b = b + 10; 
      if (b > 255) {
        b = 255;
      }
      break;
    }
  case 'r': 
    { 
      r = r - 10; 
      if (r > 255) {
        r = 255;
      }
      break;
    }
  case 'g': 
    { 
      g = g - 10; 
      if (g > 255) {
        g = 255;
      }
      break;
    }
  case 'b': 
    { 
      b = b - 10; 
      if (b > 255) {
        b = 255;
      }
      break;
    }
  default: 
  }
}// end key pressed
