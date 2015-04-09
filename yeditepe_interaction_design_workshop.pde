import controlP5.*;

ControlP5 cp5;

// Import pdf library to use pdf methods
import processing.pdf.*;

boolean save;

int centerX;
int centerY;

// Rectangle variables
int rect_radius;
int rect_num;
int rect_w;
int rect_h;
int rect_thickness;
boolean drawRectangles;

// Line variables
int line_radius;
int line_num;
int line_w;
int line_thickness;
boolean drawLines;

// Circles variables
int circle_radius;
int circle_num;
int circle_r;
int circle_thickness;
boolean drawCircles;

void setup() {
  size(1024, 768);
  background(0);

  // set save var default value to false
  save = false;

  // Default Rectangle variables
  rect_radius = 100;
  rect_num = 12;
  rect_w = 30;
  rect_h = 30;
  rect_thickness = 1;
  drawRectangles = true;

  // Default Line variables
  line_radius = 10;
  line_num = 12;
  line_w = 70;
  line_thickness = 1;
  drawLines = true;

  // Default Circle variables
  circle_radius = 30;
  circle_num = 12;
  circle_r = 10;
  circle_thickness = 1;
  drawCircles = true;

  // Window Center position
  centerX = int(width) / 2;
  centerY = int(height) / 2;
  
  // GUI
  cp5 = new ControlP5(this);
     
  // create a toggle
  cp5.addToggle("drawLines")
     .setPosition(20,20)
     .setSize(10,10)
     .setValue(drawLines)
     ;
     
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("line_radius")
     .setPosition(20,55)
     .setSize(100,10)
     .setRange(0,255)
     .setValue(line_radius)
     ;
}

void draw() {

  // ---------------------------------------------------------------
  // Begin Recording...
  // ---------------------------------------------------------------
  if (save == true) 
  {
    int d = day();    // Values from 1 - 31
    int m = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.
    int h = hour();
    int mi = minute();
    int s = second();
    
    // Convert to string
    String cday = String.valueOf(d);
    String cmonth = String.valueOf(m);
    String cyear = String.valueOf(y);
    String chour = String.valueOf(h);
    String cminute = String.valueOf(mi);
    String csecond = String.valueOf(s);
    
    beginRecord(PDF, "name-surname-"+ cyear + "-" + cmonth + "-" + cday + "-" + chour + ":" + cminute + ":" + csecond +".ai");
  }
  // ---------------------------------------------------------------

  background(0);

  // RECTANGLES
  float x, y;

  // to make equal space around 360 degree of circle
  float anglePerRect = 360.0f / rect_num;  

  for (int num=0; num < rect_num; num+= 1) {

    float rad = num * anglePerRect * (PI / 180);

    x = centerX + (rect_radius * cos(rad));
    y = centerY + (rect_radius * sin(rad));

    noFill();
    pushMatrix();
  
    translate(x, y);
    rectMode(CENTER);
    rotate(rad);
    //radians(num * anglePerRect)
    stroke(255);

    if (drawRectangles == true) {
      rect(0, 0, rect_w, rect_h);
    }

    rectMode(CORNER);
    popMatrix();
  }
  // RECTANGLE END

  // LINES
  float xl, yl;

  // to make equal space around 360 degree of circle
  float anglePerLine = 360.0f / line_num;  

  for (int num=0; num < line_num; num+= 1) {

    float rad = num * anglePerLine * (PI / 180);

    xl = centerX + (line_radius * cos(rad));
    yl = centerY + (line_radius * sin(rad));

    noFill();
    pushMatrix();
  
    translate(xl, yl);
    rotate(rad);
    stroke(255);

    if (drawLines == true) {
      line(0, 0, line_w, 0);
    }

    rectMode(CORNER);
    popMatrix();
  }
  
  // CIRCLES
  float xc, yc;

  // to make equal space around 360 degree of circle
  float anglePerCircle = 360.0f / circle_num;  

  for (int num=0; num < circle_num; num+= 1) {

    float rad = num * anglePerCircle * (PI / 180);

    xc = centerX + (circle_radius * cos(rad));
    yc = centerY + (circle_radius * sin(rad));

    noFill();
    pushMatrix();
  
    translate(xc, yc);
    rotate(rad);
    stroke(255);

    if (drawCircles == true) {
      ellipse(0, 0, circle_r,circle_r);
    }

    rectMode(CORNER);
    popMatrix();
  }
  
  // ---------------------------------------------------------------
  // Stop Recording...
  // ---------------------------------------------------------------
  if (save == true) 
  {
    endRecord();
    save = false;  // Set it to false to record just single frame
  }
  // ---------------------------------------------------------------
  
  if(keyPressed && key == 'q') {
    rect_radius++;
  }
  
  if(keyPressed && key == 'a') {
    rect_radius--;
  }
  
  if(keyPressed && key == 'w') {
    rect_num++;
  }
  
  if(keyPressed && key == 's') {
    rect_num--;
  }
  
}

void keyPressed() {

  if (key >= 'r') {
    save = true;
  }


  if (key == '1') {
    drawRectangles = !drawRectangles;
  }
  
  if (key == '2') {
    drawLines = !drawLines;
  }
  
  if (key == '3') {
    drawCircles = !drawCircles;
  }
  
  if(key == 'a') {
    rect_radius--;
  }
}

