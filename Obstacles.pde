
boolean youLose=false;
class Obstacles {
  int ObsX[][] = {{85, 120, 150}, {}};


  int oneSectionObsX[] = {85, 120, 150};
  int oneSectionObsY[] = {-85, -100, -115};

  int oneRandomPlacement1;
  int oneRandomPlacement2;



  Obstacles() {
  }

  void newReferencePoint() {
    translate(width/2, height/2);
  }

  void oneSectionObstacles() { 
    oneRandomPlacement1 = round(random(3))%3;
    oneRandomPlacement2 = round(random(3))%3;

    if (startDriving==true) {

      rect(oneSectionObsX[oneRandomPlacement1], oneSectionObsY[oneRandomPlacement1], 10, 10);
      rect(oneSectionObsX[oneRandomPlacement2], oneSectionObsY[oneRandomPlacement2], 10, 10);
    }
  }

  void redrawObstacles() {
  }

  //void lossChecker() {
  //  if (youLose==true)speed=0;
  //  if ( (togetherx==-15&&(oneRandomPlacement1==2||oneRandomPlacement2==0)&&r==-55)) {
  //    youLose=true;
  //  }
  //}
}
