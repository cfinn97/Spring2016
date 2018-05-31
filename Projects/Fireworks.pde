/*
  fireworks.pde
  
  Simulation of a fireworks display, based on code written  by Stina Bridgeman
  
*/

// Each "particle" in the explosion has a number of properties to track.

// Position an velocity
float[] x, y, xspeed, yspeed;
float[] x2, y2, x2speed, y2speed;
float[] x3, y3, x3speed, y3speed;
float[] x4, y4, x4speed, y4speed;
float[] x5, y5, x5speed, y5speed;

float [] m;

// Color and transparency
float[] r, r2, r3, r4, r5, g, g2, g3, g4, g5, b, b2, b3, b4, b5;
float[] transparency, transparency2, transparency3, transparency4, transparency5; // this is used to make a particle "fade out"

float count, count2, count3, count4, count5;  // How high the "rocket" will travel before exploding

boolean exploding, exploding2, exploding3, exploding4, exploding5; 
// Each firework is either in a state of explosion or about to explode

void setup () {
  size(500, 500);
  smooth();
  
  //frameRate(10);

  int numsparks = 700;
  x = new float[numsparks]; x2 = new float[numsparks];  x3 = new float[numsparks];  x4 = new float[numsparks];  x5 = new float[numsparks];
  y = new float[numsparks]; y2 = new float[numsparks]; y3 = new float[numsparks]; y4 = new float[numsparks]; y5 = new float[numsparks];
  xspeed = new float[numsparks]; x2speed = new float[numsparks]; x3speed = new float[numsparks]; x4speed = new float[numsparks]; x5speed = new float[numsparks];
  yspeed = new float[numsparks]; y2speed = new float[numsparks]; y3speed = new float[numsparks]; y4speed = new float[numsparks]; y5speed = new float[numsparks];

  transparency = new float[numsparks]; transparency2 = new float[numsparks]; transparency3 = new float[numsparks]; transparency4 = new float[numsparks]; transparency5 = new float[numsparks];
  r = new float[numsparks]; r2 = new float[numsparks]; r3 = new float[numsparks]; r4 = new float[numsparks]; r5 = new float[numsparks];
  g = new float[numsparks]; g2 = new float[numsparks]; g3 = new float[numsparks]; g4 = new float[numsparks]; g5 = new float[numsparks];
  b = new float[numsparks]; b2 = new float[numsparks]; b3 = new float[numsparks]; b4 = new float[numsparks]; b5 = new float[numsparks];
  
  m = new float [1];

  reset(random(0, 255), random(0, 255), random(0, 255));
  background(0);
  noStroke();


}

void draw () {
  // First, draw the sky, with a fading effect (causes most 
  // recent image to be only partially covered, with successive
  // frames covering up more and more)
  
    fill(0, 0, 0, 10);
    rect(0, 0, width, height);
  
  // Re-draw the moon (after the sky, so that it doesn't fade, too).
  
  for ( int M = 0 ; M < m.length; M+= 1) {
    fill(200);
    ellipse(m[M], 50, 50, 50); // moon
      m[M] = m[M] + 0.1;
    }

  // Now the fireworks.  Draw all the particles at their current positions
  
  // firework 1
  for ( int i = 0 ; i < x.length ; i++ ) {
    fill(r[i], g[i], b[i], transparency[i]);
    ellipse(x[i], y[i], 4, 4);
  }
    // firework 2

  for ( int i = 0 ; i < x2.length ; i++ ) {
    fill(b2[i], r2[i], g2[i], transparency2[i]);
    ellipse(x2[i], y2[i] + 15, 4, 4);
  }
  
  // firework 3
  for ( int i = 0 ; i < x3.length ; i++ ) {
    fill(g3[i], b3[i], r3[i], transparency3[i]);
    ellipse(x3[i], y3[i], 4, 4);
  }
// firework 4
  for ( int i = 0 ; i < x4.length ; i++ ) {
    fill(b4[i], g4[i], r4[i], transparency4[i]);
    ellipse(x4[i], y4[i], 4, 4);
  }
  // firework 5
  for ( int i = 0 ; i < x5.length ; i++ ) {
    fill(b5[i], g5[i], r5[i], transparency5[i]);
    ellipse(x5[i], y5[i], 4, 4);
  }
  {
  // update the particle positions and transparency (controls fading effect)
  for ( int i = 0 ; i < x.length ; i++ ) {
    x[i] = x[i]+xspeed[i];
    y[i] = y[i]+yspeed[i];
    if ( exploding ) {
      yspeed[i] = yspeed[i] + .04;
      transparency[i] = transparency[i]-2;  
      // controls length of fireworks "trails"
    }
  } 

  // Once we have counted down to 0, explode
  if ( count <= 0 && !exploding ) {
    for ( int i = 0 ; i < x.length ; i++ ) {
      float angle = random(0, 2*PI);
      xspeed[i] = xspeed[i]+cos(angle)*random(0, 1.5);
      yspeed[i] = yspeed[i]+sin(angle)*random(0, 1.5)+random(0, 1); // exlposion motion
    } 
    exploding = true;
    count = 150;
  }

  if ( count <= 0 && exploding ) {
    reset(random(0, 255), random(0, 255), random(0, 255));
  }

  count = count-1;
}
{
  // 2: update the particle positions and transparency (controls fading effect)
  for ( int i = 0 ; i < x2.length ; i++ ) {
    x2[i] = x2[i]+x2speed[i];
    y2[i] = y2[i]+y2speed[i];
    if ( exploding2 ) {
      y2speed[i] = y2speed[i] + .04;
      transparency2[i] = transparency2[i]-2;  
      // controls length of fireworks "trails"
    }
  } 

  // Once we have counted down to 0, explode
  if ( count2 <= 0 && !exploding2 ) {
    for ( int i = 0 ; i < x2.length ; i++ ) {
      float angle = random(0, 2*PI);
      x2speed[i] = x2speed[i]+cos(angle)*random(0, 1.5);
      y2speed[i] = y2speed[i]+sin(angle)*random(0, 1.5)+random(0, 1); // exlposion motion
    } 
    exploding2 = true;
    count2 = 150;
  }

  if ( count2 <= 0 && exploding2 ) {
    reset2(random(0, 255), random(0, 255), random(0, 255));
  }

  count2 = count2-1;
}
{
  // 3: update the particle positions and transparency (controls fading effect)
  for ( int i = 0 ; i < x3.length ; i++ ) {
    x3[i] = x3[i]+x3speed[i];
    y3[i] = y3[i]+y3speed[i];
    if ( exploding3 ) {
      y3speed[i] = y3speed[i] + .04;
      transparency3[i] = transparency3[i]-2;  
      // controls length of fireworks "trails"
    }
  } 

  // Once we have counted down to 0, explode
  if ( count3 <= 0 && !exploding3 ) {
    for ( int i = 0 ; i < x3.length ; i++ ) {
      float angle = random(0, 2*PI);
      x3speed[i] = x3speed[i]+cos(angle)*random(0, 1.5);
      y3speed[i] = y3speed[i]+sin(angle)*random(0, 1.5)+random(0, 1); // exlposion motion
    } 
    exploding3 = true;
    count3 = 150;
  }

  if ( count3 <= 0 && exploding3 ) {
    reset3(random(0, 255), random(0, 255), random(0, 255));
  }

  count3 = count3-1;
}
{
  // 4: update the particle positions and transparency (controls fading effect)
  for ( int i = 0 ; i < x4.length ; i++ ) {
    x4[i] = x4[i]+x4speed[i];
    y4[i] = y4[i]+y4speed[i];
    if ( exploding4 ) {
      y4speed[i] = y4speed[i] + .04;
      transparency4[i] = transparency4[i]-2;  
      // controls length of fireworks "trails"
    }
  } 

  // Once we have counted down to 0, explode
  if ( count4 <= 0 && !exploding4 ) {
    for ( int i = 0 ; i < x4.length ; i++ ) {
      float angle = random(0, 2*PI);
      x4speed[i] = x4speed[i]+cos(angle)*random(0, 1.5);
      y4speed[i] = y4speed[i]+sin(angle)*random(0, 1.5)+random(0, 1); // exlposion motion
    } 
    exploding4 = true;
    count4 = 150;
  }

  if ( count4 <= 0 && exploding4 ) {
    reset4(random(0, 255), random(0, 255), random(0, 255));
  }

  count4 = count4-1;
}
{
  // 5:  update the particle positions and transparency (controls fading effect)
  for ( int i = 0 ; i < x5.length ; i++ ) {
    x5[i] = x5[i]+x5speed[i];
    y5[i] = y5[i]+y5speed[i];
    if ( exploding5 ) {
      y5speed[i] = y5speed[i] + .04;
      transparency5[i] = transparency5[i]-2;  
      // controls length of fireworks "trails"
    }
  } 

  // Once we have counted down to 0, explode
  if ( count5 <= 0 && !exploding5 ) {
    for ( int i = 0 ; i < x5.length ; i++ ) {
      float angle = random(0, 2*PI);
      x5speed[i] = x5speed[i]+cos(angle)*random(0, 1.5);
      y5speed[i] = y5speed[i]+sin(angle)*random(0, 1.5)+random(0, 1); // exlposion motion
    } 
    exploding5 = true;
    count5 = 150;
  }

  if ( count5 <= 0 && exploding5 ) {
    reset5(random(0, 255), random(0, 255), random(0, 255));
  }

  count5 = count5-1;
}
}// draw

void reset ( float targetr, float targetg, float targetb ) {
  // Create a new rocket, by re-initializing all of the particle properties.
  // The parameters are red,green, and blue values, used to bias the color 
  // scheme for the explosion.

  float startx = random(width/6.0, 3.0*width/4.0); 
  // Choose a launch position on the ground
  
  float xvel = random(-0.75,0.75);
  for ( int i = 0 ; i < x.length ; i++ ) {
    x[i] = startx;
    y[i] = height;
    xspeed[i] = xvel;
    yspeed[i] = -3;
    transparency[i] = random(200, 255);
    r[i] = targetr+random(-30, 30);
    g[i] = targetg+random(-30, 30);
    b[i] = targetb+random(-30, 30);
  }

  count = random(height/6.0, 2.0*height/3.0)/3.0;  // Set countdown to explosion
  exploding = false;
} // reset()
void reset2 ( float targetr, float targetg, float targetb ) {
  // Create a new rocket, by re-initializing all of the particle properties.
  // The parameters are red,green, and blue values, used to bias the color 
  // scheme for the explosion.

  float start2x = random(width/6.0, 3.0*width/4.0); 
  // Choose a launch position on the ground
  
  float x2vel = random(-0.75,0.75);
  for ( int i = 0 ; i < x2.length ; i++ ) {
    x2[i] = start2x;
    y2[i] = height;
    x2speed[i] = x2vel;
    y2speed[i] = -3;
    transparency2[i] = random(200, 255);
    r2[i] = targetr+random(-30, 30);
    g2[i] = targetg+random(-30, 30);
    b2[i] = targetb+random(-30, 30);
  }

  count2 = random(height/6.0, 2.0*height/3.0)/3.0;  // Set countdown to explosion
  exploding2 = false;
} // reset()
void reset3 ( float targetr, float targetg, float targetb ) {
  // Create a new rocket, by re-initializing all of the particle properties.
  // The parameters are red,green, and blue values, used to bias the color 
  // scheme for the explosion.

  float start3x = random(width/6.0, 3.0*width/4.0); 
  // Choose a launch position on the ground
  
  float x3vel = random(-0.75,0.75);
  for ( int i = 0 ; i < x3.length ; i++ ) {
    x3[i] = start3x;
    y3[i] = height;
    x3speed[i] = x3vel;
    y3speed[i] = -3;
    transparency[i] = random(200, 255);
    r3[i] = targetr+random(-30, 30);
    g3[i] = targetg+random(-30, 30);
    b3[i] = targetb+random(-30, 30);
  }

  count3 = random(height/6.0, 2.0*height/3.0)/3.0;  // Set countdown to explosion
  exploding3 = false;
} // reset()
void reset4 ( float targetr, float targetg, float targetb ) {
  // Create a new rocket, by re-initializing all of the particle properties.
  // The parameters are red,green, and blue values, used to bias the color 
  // scheme for the explosion.

  float start4x = random(width/6.0, 3.0*width/4.0); 
  // Choose a launch position on the ground
  
  float x4vel = random(-0.75,0.75);
  for ( int i = 0 ; i < x4.length ; i++ ) {
    x4[i] = start4x;
    y4[i] = height;
    x4speed[i] = x4vel;
    y4speed[i] = -3;
    transparency[i] = random(200, 255);
    r4[i] = targetr+random(-30, 30);
    g4[i] = targetg+random(-30, 30);
    b4[i] = targetb+random(-30, 30);
  }

  count4 = random(height/6.0, 2.0*height/3.0)/3.0;  // Set countdown to explosion
  exploding4 = false;
} // reset()
void reset5 ( float targetr, float targetg, float targetb ) {
  // Create a new rocket, by re-initializing all of the particle properties.
  // The parameters are red,green, and blue values, used to bias the color 
  // scheme for the explosion.

  float start5x = random(width/6.0, 3.0*width/4.0); 
  // Choose a launch position on the ground
  
  float x5vel = random(-0.75,0.75);
  for ( int i = 0 ; i < x5.length ; i++ ) {
    x5[i] = start5x;
    y5[i] = height;
    x5speed[i] = x5vel;
    y5speed[i] = -3;
    transparency[i] = random(200, 255);
    r5[i] = targetr+random(-30, 30);
    g5[i] = targetg+random(-30, 30);
    b5[i] = targetb+random(-30, 30);
  }

  count5 = random(height/6.0, 2.0*height/3.0)/3.0;  // Set countdown to explosion
  exploding5 = false;
} // reset()
