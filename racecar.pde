
int lapCount;//starting degrees of car's rotation around center of window
int togetherx= -15;//keeps the car together; used to switch lanes
float speed;

boolean startDriving=false;

class raceCar {
  color c;
  float xpos, ypos, off=7;
  boolean titleScreen=true;

  float r=-90;


  raceCar() {
    c = color(200, 155, 25);
    xpos = width/2;
    ypos = 15;
  }

  void onTrack() {
    pushMatrix();
    translate(width/2, height/2); //changes car's reference point from top left of window (0,0) to middle of window.
    rotate(radians(r));
  }


  void carDisplay() {
    noStroke();
    rectMode(CENTER);
    //body of car
    fill(c);
    rect(xpos+togetherx, 0, 18, 12);
    fill(0);

    //wheels
    fill(0);
    rect(xpos-off+togetherx, -off, off, off/2);
    rect(xpos+off+togetherx, -off, off, off/2);
    rect(xpos-off+togetherx, off, off, off/2);
    rect(xpos+off+togetherx, off, off, off/2);
    popMatrix();

    if (startDriving==true) {
      r+=speed;
    }
  }

  void switchinLanes() { //allows user to switch lanes using arrow keys; also creates barriers so user cannot leave track.
    if (keyCode==DOWN&&togetherx>-85) { //move closer to center of track
      togetherx-=35;
      // println(togetherx);
    }
    if (keyCode==UP&&togetherx<-15) { //move closer to outside of track
      togetherx+=35;
      //println(togetherx);
    }
  }

  void laneSpeeds() { // makes outside lane faster than inside lanes
    float lane1Speed=1.642; //speeds adjusted so that each lap takes about 3.82 seconds to complete, regardless of lane.
    float lane2Speed=1.646;
    float lane3Speed=1.649;


    if (togetherx==-85) { //if car is in inner most lane
      speed=lane1Speed;
    }
    if (togetherx==-50) { //if car is in middle lane
      speed=lane2Speed;
    }

    if (togetherx==-15) { //if car is in outter most lane
      speed=lane3Speed;
    }
  }

  void drawScoreBoard() {
    if (startDriving==true) {
      arcadeFont();
      fill(0);
      textAlign(CENTER); 
      textSize(25);
      text("Score" +"\n" + lapCount + "  Laps", width/2, height/2);
    }
  }

  void incrementLap() {
      lapCount+=1;
      r=-90;
  }

  void startCar() {
    if (startDriving==false&&titleScreen==false) {
      arcadeFont();
      fill(0);
      textAlign(CENTER);
      textSize(25);
      text("Press Space" + " \n" + "to Begin!", width/2, height/2);
    }
    if (key==' ') {
      startDriving=true;
    }
  }

  void drawTrack() {

    stroke(255);
    strokeWeight(3);

    //track with decreasing sizes of ellipses
    fill(220);
    ellipse(width/2, height/2, width, height);
    ellipse(width/2, height/2, width/1.2, height/1.2);
    ellipse(width/2, height/2, width/1.5, height/1.5);

    //middle circle with  timer + health
    fill(255, 0, 0); 
    ellipse(width/2, height/2, width/2, height/2);
  }
  void lapLine() {
    stroke(255, 0, 0);
    line(width/2, 0, width/2, (height-height/1.5)-35);
  }

  void titleScreen() {
    if (titleScreen==true) {
      rectMode(CORNER);
      fill(136, 32, 240);
      rect(0, 0, width, height);

      rc.arcadeFont();
      fill(0);
      textAlign(CENTER);
      textSize(40);
      text("Welcome to" + "\n" + "DRIFT KING", width/2, height/4);
      text("Press Enter", width/2, height/1.2);
    }
  }

  float giveCarPosition() {
    return r;
  }

  void exitTitleScreen() {
    if (keyCode==ENTER) {
      titleScreen=false;
    }
  }



  void arcadeFont() {
    PFont arcadeFont;
    arcadeFont = createFont("ARCADECLASSIC.TTF", 20);
    textFont(arcadeFont);
  }
}
