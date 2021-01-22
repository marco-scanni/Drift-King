class track{
  int lane1Trees[], lane2Trees[], lane3Trees[];
  track(){
    
  }
  
  void drawTrack(){
  
  stroke(255);
  strokeWeight(3);
  
  //track with decreasing sizes of ellipses
  fill(220);
  ellipse(width/2,height/2,width,height);
  ellipse(width/2,height/2,width/1.2,height/1.2);
  ellipse(width/2,height/2,width/1.5,height/1.5);
  
  //middle circle with  timer + health
  fill(255,0,0); 
  ellipse(width/2,height/2,width/2,height/2);  
}
  void lapLine(){
   stroke(255,0,0);
    line(width/2,0,width/2,(height-height/1.5)-35); 
  }
  
  void obstacleArrays(){
    rect(0,0,100,100);
  }

}
