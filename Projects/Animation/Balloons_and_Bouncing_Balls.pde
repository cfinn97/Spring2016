/*
 project3 ( 1 of 3 )
 Author: Camera Finn
 CPSC 120 (Spring 2016), Project 3
 */

int totalBalloons = 10;
int totalBalls = 1;
Balloon[] balloon = {};            
Ball[] ball = {};

boolean play;
void setup() {
  size(1280, 700);
  background (220, 240, 255);
  smooth();
  play = true;
  drawBalloons();
  drawBall();
}

void draw() {
  background (220, 240, 255);
  for (int i = 0; i < balloon.length; i++) {
    Balloon bln = balloon[i];
    bln.displayBalloon();
    bln.update();
  }
  for (int i = 0; i < ball.length; i++) {
    Ball bs = ball[i];
    bs.displayBall();
    bs.update();
  }
}

void keyPressed() {
  if (keyCode == ENTER || keyCode == RETURN) {
    // 10 balloons are made at a random x-coordinate
    // and at a random height below the window and floats up
    //when the enter/return key is pressed
    drawBalloons();
    println(balloon.length);
  }  

  if (key == ' ') {
    // press space key to pause and resume action/loop
    if (play) {
      noLoop();
      play = false;
    } else if (play == false) {
      loop();
      play = true;
    }
  }
}

void mouseClicked() {
  // a ball is drawn at a random x-coordinate and a random y-coordinate
  //when the mouse is clicked
  drawBall();
  println(ball.length);
}

void drawBalloons() {
  for (int i = 0; i < totalBalloons; i++) {
    Balloon bln = new Balloon();
    balloon = (Balloon[])append(balloon, bln);
  }
}
//append source: http://learningprocessing.com/examples/chp09/example-09-11-array-append

void drawBall() {
  for (int i = 0; i < totalBalls; i++) {
    Ball bs = new Ball((int) random(200, width - 200), (int) random(200, height - 200));
    ball = (Ball[])append(ball, bs);
  }
}
