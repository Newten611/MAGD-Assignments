float ball_y=660;
float ball_x=100;
float y_acceleration=0;
float x_acceleration=0;
float throwingPower=0;

void setup(){
  size(800,800);
}

void draw(){
  background(200,220,255);
  ball_y=ball_y - y_acceleration;  // Ball Movement                                  Hold mouse to charge throw. Press any key to reset.
  ball_x=ball_x + x_acceleration;
  
  fill(250,150,0);
  noStroke();
  ellipse(ball_x, ball_y, 80, 80);  // Basketball
  fill(255,255,255,30);
  for(int b=0; b<70; b=b+10){
    ellipse(ball_x, ball_y, b, b);
  }
  
  stroke(0);                     // Basketball Hoop
  strokeWeight(20);
  line(700,200,700,900);
  line(550,360,700,360);
  stroke(255);
  line(680,200,680,350);
  strokeWeight(10);
  line(570,360,590,450);
  line(585,360,605,450);
  line(600,360,620,450);
  line(615,360,635,450);
  line(610,360,590,450);
  line(625,360,605,450);
  line(640,360,620,450);
  line(655,360,635,450);
  noStroke();
  
  if(ball_y<660){
  y_acceleration=y_acceleration-0.5;  //  Gravity
  } else{
    y_acceleration=0;
  }
  if(x_acceleration>0){
    x_acceleration=x_acceleration-0.05;
  }
  
  if(mousePressed==true){   // Throw Charge Up
    throwingPower=throwingPower+0.5;
  }
  
  fill(100,255,50);
  rect(-100,700,1000,200);
    
}

void mouseReleased(){
  throwBall();
}

void throwBall(){
  y_acceleration=throwingPower;
  x_acceleration=throwingPower/2;
  throwingPower=0;
}

void keyPressed(){
  ball_x=100;
  ball_y=660;
  y_acceleration=0;
  x_acceleration=0;
  
}
