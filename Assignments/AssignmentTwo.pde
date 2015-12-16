int rect1X=800;
int rect1Y=201;
int rect2X=750;
int rect2Y=201;
int rect3X=900;
int rect3Y=201;
int rectAlpha;
int circlearcrotations=90;

void setup(){
  size(1280,800);
}

void draw(){
  background(255);
  
  //misc lines
  stroke(0);
  strokeWeight(10);
  fill(255);
  rect(50,50,1100,700);
  line(900,50,900,750);
  line(800,50,800,750);
  line(750,50,750,750);
  line(50,200,1150,200);
  
  //Start of rectangle code
  if((mousePressed==true) && (mouseButton==LEFT)){
    
    rectAlpha=rectAlpha+mouseX-pmouseX;
     if(rectAlpha>255){
      rectAlpha=255;
      }
     if(rectAlpha<0){
      rectAlpha=0;
      }
    
    //movement of rect 1
    if((mouseX>rect1X) && (mouseX<rect1X+100) && (mouseY>rect1Y) && (mouseY<rect1Y+100) && (rect1Y > 200) && (rect1Y < 650)){
      rect1Y=rect1Y+mouseY-pmouseY;
      if(rect1Y<=200){
      rect1Y=201;
      }
      if(rect1Y>=650){
      rect1Y=649;
      }
    }
    //movement of rect 2
    if((mouseX>rect2X) && (mouseX<rect2X+50) && (mouseY>rect2Y) && (mouseY<rect2Y+50) && (rect2Y > 200) && (rect2Y < 700)){
      rect2Y=rect2Y+mouseY-pmouseY;
      if(rect2Y<=200){
      rect2Y=201;
      }
      if(rect2Y>=700){
      rect2Y=699;
      }
    }
    //movement of rect 3
    if((mouseX>rect3X) && (mouseX<rect3X+200) && (mouseY>rect3Y) && (mouseY<rect3Y+200) && (rect3Y > 200) && (rect3Y < 500)){
      rect3Y=rect3Y+mouseY-pmouseY;
      if(rect3Y<=200){
      rect3Y=201;
      }
      if(rect3Y>=500){
      rect3Y=499;
      }
    }
  }
  
  //Drawing Rectangle
  fill(255,0,0,rectAlpha);
  rect(rect1X,rect1Y,100,100);
  fill(0,255,0,rectAlpha);
  rect(rect2X,rect2Y,50,50);
  fill(0,0,255,rectAlpha);
  rect(rect3X,rect3Y,250,250);
  
  //dots in the corner
  strokeWeight(30);
  stroke(0);
  point(975,125);
  point(1025,125);
  point(1075,125);
  point(850,125);
  
  //many triangles
  strokeWeight(10);
  fill(255,255,0,100);
  triangle(50,50,150,50,100,200);
  triangle(150,50,250,50,200,200);
  triangle(250,50,350,50,300,200);
  triangle(350,50,450,50,400,200);
  triangle(450,50,550,50,500,200);
  triangle(550,50,650,50,600,200);
  triangle(650,50,750,50,700,200);
  
  //irregular polygons
  beginShape();
  vertex(750,750);
  vertex(750,650);
  vertex(700,700);
  vertex(700,750);
  vertex(750,750);
  endShape();
  
  beginShape();
  vertex(50,200);
  vertex(50,300);
  vertex(100,250);
  vertex(100,200);
  vertex(50,200);
  endShape();
  
  beginShape();
  vertex(750,200);
  vertex(750,300);
  vertex(700,250);
  vertex(700,200);
  vertex(750,200);
  endShape();
  
  beginShape();
  vertex(50,750);
  vertex(50,650);
  vertex(100,700);
  vertex(100,750);
  vertex(50,750);
  endShape();
  
  //turning circle thing
  ellipseMode(CENTER);
  fill(100,100,255);
  translate(400,475);
  if((mousePressed==true) && (mouseButton==RIGHT)){
    circlearcrotations=circlearcrotations+mouseY-pmouseY+mouseX-pmouseX;
  }
  rotate(radians(circlearcrotations));
  arc(0,0,500,500,PI*3/2,TAU,PIE);
  arc(0,0,400,400,PI/2,PI,PIE);
  arc(0,0,350,350,0,PI/2,PIE);
  arc(0,0,450,450,PI,PI*3/2,PIE);
  fill(255,255,255,100);
  ellipse(0,0,300,300);
  ellipse(0,0,250,250);
}
  
