raceCar rc;
Obstacles obs;

void setup() {
  size(400, 400);
  rc = new raceCar();

  obs = new Obstacles();
}

void draw() {
  background(0, 200, 200);

  rc.drawTrack();
  rc.lapLine();

  rc.onTrack();
  rc.carDisplay();
  rc.laneSpeeds();
  rc.drawScoreBoard();
  rc.titleScreen();
  rc.startCar();

  obs.newReferencePoint();

  if (rc.giveCarPosition()>=270) {
    rc.incrementLap();
    obs.oneSectionObstacles();
  }

}

void keyPressed() {
  rc.switchinLanes(); 
  rc.exitTitleScreen();
}
