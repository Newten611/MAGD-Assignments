
int TardisAlpha=255;
int TardisAlphaChange=1;
int TardisScale=1;
int TardisLight=#8B8B8A;

int fullRotationX=90;
int fullRotationY=1;

int VortexRotation=1;
int VortexDistance=5;
int VortexMinDistance=1600;
int VortexMaxDistance=-1600;
int PolygonDistance1=-1600;
int PolygonDistance2=0;
int PolygonDistance3=-800;
int PolygonDistance4=800;                                                // SO MANY VARIABLES! I will try using arrays next time...
int ArcDistance1=-1500;
int ArcDistance2=100;
int TriangleDistance1=-1400;
int TriangleDistance2=200;                                        // Left click and drag to rotate tardis
                                                                  // Right click to make the Tardis Fade in and out
int RectDistance1=-1300;                                          // Press Up on the keyboard to speed up the vortex, press Down to make it slower
int RectDistance2=300;
int EllipseDistance1=-1200;                                       // I hope you enjoy!   -Andrew
int EllipseDistance2=400;
int LineDistance1=-1100;
int LineDistance2=500;
int PointDistance1=-1000;
int PointDistance2=600;


void setup(){
  size(800,800,P3D);
}
void draw(){
  lights();
  background(#964798);
  translate(400,400,0);
  
  VortexRotation=VortexRotation+10; //Basis of the time tortex rotation
  rotateZ(radians(VortexRotation));
  if(VortexRotation>360){
  VortexRotation=VortexRotation-360;//Keeps the rotation variable to a reasonable size
  }
  
  rectMode(CENTER);
  stroke(#852FA0);
  strokeWeight(100);
  noFill();
  
  //                                Start of the shapes that make up the Vortex
  pushMatrix();
  translate(0,0,PolygonDistance1);
  beginShape();
  vertex(-500,0);
  vertex(0,-500);
  vertex(500,0);
  vertex(0,500);
  vertex(-500,0);
  endShape();
  popMatrix();
  
  stroke(#835093);
  
  pushMatrix();
  translate(0,0,PolygonDistance2);
  beginShape();
  vertex(-500,0);
  vertex(0,-500);
  vertex(500,0);
  vertex(0,500);
  vertex(-500,0);
  endShape();
  popMatrix();
  
  stroke(#7319B4);
  
  pushMatrix();
  translate(0,0,PolygonDistance3);
  beginShape();
  vertex(-500,0);
  vertex(0,-500);
  vertex(500,0);
  vertex(0,500);
  vertex(-500,0);
  endShape();
  popMatrix();
  
  stroke(#A35DD6);
  
  pushMatrix();
  translate(0,0,PolygonDistance4);
  beginShape();
  vertex(-500,0);
  vertex(0,-500);
  vertex(500,0);
  vertex(0,500);
  vertex(-500,0);
  endShape();
  popMatrix();
  
  stroke(#6D4DCE);
  
  pushMatrix();
  translate(0,0,ArcDistance1);
  arc(0,0,1000,1000,PI,TAU);
  popMatrix();
  
  stroke(255,0,255);
  
  pushMatrix();
  translate(0,0,ArcDistance2);
  arc(0,0,1000,1000,TAU,PI);
  popMatrix();
  
  stroke(#B24DCE);
  
  pushMatrix();
  translate(0,0,TriangleDistance1);
  triangle(0,-500,500,500,-500,500);
  popMatrix();
  
  stroke(#8E1D88);
  
  pushMatrix();
  translate(0,0,TriangleDistance2);
  triangle(0,500,500,-500,-500,-500);
  popMatrix();
  
  stroke(#6C2869);
  
  pushMatrix();
  translate(0,0,RectDistance1);
  rect(0,0,900,1000);
  popMatrix();
  
  stroke(#916CC6);
  
  pushMatrix();
  translate(0,0,RectDistance2);
  rect(0,0,1000,900);
  popMatrix();
  
  stroke(#5E449D);
  
  pushMatrix();
  translate(0,0,EllipseDistance1);
  ellipse(0,0,900,1000);
  popMatrix();
  
  stroke(#7548E0);
  
  pushMatrix();
  translate(0,0,EllipseDistance2);
  ellipse(0,0,1000,900);
  popMatrix();
  
  stroke(#7012AF);
  
  pushMatrix();
  translate(0,0,LineDistance1);
  line(-500,0,0,-500);
  popMatrix();
  
  stroke(#B446FF);
  
  pushMatrix();
  translate(0,0,LineDistance2);
  line(500,0,0,500);
  popMatrix();
  
  stroke(#6E46E0);
  
  pushMatrix();
  translate(0,0,PointDistance1);
  point(400,250);
  popMatrix();
  
  stroke(#7A5D93);
  
  pushMatrix();
  translate(0,0,PointDistance2);
  point(-400,-250);
  popMatrix();
  
  rotateZ(radians(-VortexRotation));// Reverses the rotation so that the Tardis does not spin
  
  //Tardis Motion Logic
  if(mousePressed==true){
    if((fullRotationX<=90) && (fullRotationX>=0)){// Locks the X rotation between 0 and 90 degrees
    fullRotationX=fullRotationX-mouseY+pmouseY;
    }
  }
  if(fullRotationX>90){ //backup locks
    fullRotationX=90;
  }
  if(fullRotationX<0){
    fullRotationX=0;
  }
  if(fullRotationY>360){ //keeps the variable under control
    fullRotationY=fullRotationY-360;
  }
  if(fullRotationY<0){
    fullRotationY=fullRotationY+360;
  }
  if(mousePressed==true){
    if(mouseButton==LEFT){  //allows control over Tardis
    fullRotationY=fullRotationY-mouseX+pmouseX;}
    if(mouseButton==RIGHT){ // Changes the Alpha of the Tardis
      if(TardisAlpha==0){
        TardisAlphaChange=5;}
      if(TardisAlpha==255){
        TardisAlphaChange=-5;}
        TardisAlpha=TardisAlpha+TardisAlphaChange;
    }
  }
  
  //stroke(0);
  noStroke();
  fill(17,39,125,TardisAlpha);
  
  rotateX(radians(fullRotationX));
  rotateZ(radians(fullRotationY));
  
  translate(0,0,-125);
  scale(0.65);
  
  //                            Start of Tardis Shapes
    box(280,280,20);
  
  //
  pushMatrix();
  translate(0,0,185);
    box(200,200,350);
  popMatrix();
  
  //
  pushMatrix();
  translate(110,110,185);
    box(30,30,350);
  translate(-220,0,0);
    box(30,30,350);
  translate(0,-220,0);
    box(30,30,350);
  translate(220,0,0);
    box(30,30,350);
  popMatrix();
  
  //
  pushMatrix();
  translate(-110,95,185);
    box(10,30,350);
  translate(0,-190,0);
    box(10,30,350);
  translate(220,0,0);
    box(10,30,350);
  translate(0,190,0);
    box(10,30,350);
  popMatrix();
  
  pushMatrix();
  translate(95,-110,185);
    box(30,10,350);
  translate(-190,0,0);
    box(30,10,350);
  translate(0,220,0);
    box(30,10,350);
  translate(190,0,0);
    box(30,10,350);
  popMatrix();
  
  //
  pushMatrix();
  translate(-110,0,185);
    box(10,50,350);
  translate(110,-110,0);
    box(50,10,350);
  translate(110,110,0);
    box(10,50,350);
  translate(-110,110,0);
    box(50,10,350);
  popMatrix();
  
  //
  pushMatrix();
  translate(0,0,265);
  fill(TardisLight,TardisAlpha);
  stroke(0,0,0,TardisAlpha);
  strokeWeight(4);
    box(215,215,80);
    box(105,215,80);
    box(215,105,80);
    box(215,215,26);
    box(30,30,360);
    fill(17,39,125,TardisAlpha);
    noStroke();
    translate(0,0,110);
    box(200,200,60);
    box(225,225,40);
    translate(0,0,70);
    box(40,40,10);
  popMatrix();
  
  //
  pushMatrix();
  translate(-110,0,350);
    box(10,220,30);
  translate(110,-110,0);
    box(220,10,30);
  translate(110,110,0);
    box(10,220,30);
  translate(-110,110,0);
    box(220,10,30);
  popMatrix();
  
  //
  pushMatrix();
  translate(-110,0,20);
    box(10,220,30);
  translate(110,-110,0);
    box(220,10,30);
  translate(110,110,0);
    box(10,220,30);
  translate(-110,110,0);
    box(220,10,30);
  popMatrix();
  
  //
  pushMatrix();
  translate(-110,0,80);
    box(10,220,20);
  translate(110,-110,0);
    box(220,10,20);
  translate(110,110,0);
    box(10,220,20);
  translate(-110,110,0);
    box(220,10,20);
  popMatrix();
  
  //
  pushMatrix();
  translate(-110,0,135);
    box(10,220,20);
  translate(110,-110,0);
    box(220,10,20);
  translate(110,110,0);
    box(10,220,20);
  translate(-110,110,0);
    box(220,10,20);
  popMatrix();
  
  //
  pushMatrix();
  translate(-110,0,185);
    box(10,220,20);
  translate(110,-110,0);
    box(220,10,20);
  translate(110,110,0);
    box(10,220,20);
  translate(-110,110,0);
    box(220,10,20);
  popMatrix();
  
  //
  pushMatrix();
  translate(0,0,370);
    box(280,280,20);
  popMatrix();
  
  //  Vortex Distance Logic
  
PolygonDistance1=PolygonDistance1+VortexDistance;
if(PolygonDistance1>VortexMinDistance){
  PolygonDistance1=VortexMaxDistance;}
  
PolygonDistance2=PolygonDistance2+VortexDistance;
if(PolygonDistance2>VortexMinDistance){
  PolygonDistance2=VortexMaxDistance;}
  
PolygonDistance3=PolygonDistance3+VortexDistance;
if(PolygonDistance3>VortexMinDistance){
  PolygonDistance3=VortexMaxDistance;}
  
PolygonDistance4=PolygonDistance4+VortexDistance;
if(PolygonDistance4>VortexMinDistance){
  PolygonDistance4=VortexMaxDistance;}
  
ArcDistance1=ArcDistance1+VortexDistance;
if(ArcDistance1>VortexMinDistance){
  ArcDistance1=VortexMaxDistance;}
  
ArcDistance2=ArcDistance2+VortexDistance;
if(ArcDistance2>VortexMinDistance){
  ArcDistance2=VortexMaxDistance;}
  
TriangleDistance1=TriangleDistance1+VortexDistance;
if(TriangleDistance1>VortexMinDistance){
  TriangleDistance1=VortexMaxDistance;}
  
TriangleDistance2=TriangleDistance2+VortexDistance;
if(TriangleDistance2>VortexMinDistance){
  TriangleDistance2=VortexMaxDistance;}
  
RectDistance1=RectDistance1+VortexDistance;
if(RectDistance1>VortexMinDistance){
  RectDistance1=VortexMaxDistance;}
  
RectDistance2=RectDistance2+VortexDistance;
if(PolygonDistance1>VortexMinDistance){
  PolygonDistance1=VortexMaxDistance;}
  
EllipseDistance1=EllipseDistance1+VortexDistance;
if(EllipseDistance1>VortexMinDistance){
  EllipseDistance1=VortexMaxDistance;}
  
EllipseDistance2=EllipseDistance2+VortexDistance;
if(EllipseDistance2>VortexMinDistance){
  EllipseDistance2=VortexMaxDistance;}
  
LineDistance1=LineDistance1+VortexDistance;
if(LineDistance1>VortexMinDistance){
  LineDistance1=VortexMaxDistance;}
  
LineDistance2=LineDistance2+VortexDistance;
if(LineDistance2>VortexMinDistance){
  LineDistance2=VortexMaxDistance;}
  
PointDistance1=PointDistance1+VortexDistance;
if(PointDistance1>VortexMinDistance){
  PointDistance1=VortexMaxDistance;}
  
PointDistance2=PointDistance2+VortexDistance;
if(PointDistance2>VortexMinDistance){
  PointDistance2=VortexMaxDistance;}
}

//  Time Vortex Motion
void keyPressed(){
  if(keyCode==UP){
    VortexDistance=VortexDistance+20;
  }
  if((keyCode==DOWN) && (VortexDistance>20)){
    VortexDistance=VortexDistance-20;
  }
}

void mousePressed(){
  if(mouseButton==RIGHT){
    TardisLight=#FAF9E6;
  }
}
