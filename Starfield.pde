meteor [] bob = new meteor[1000];
oddBall [] joe = new oddBall[2];
void setup(){
  size(1000, 1000);
  background(0);
  for(int i = 0; i < 1000; i++){
    bob[i] = new meteor();
  }
  for(int i = 0; i < 2; i++){
    joe[i] = new oddBall();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < 1000; i++){
    bob[i].show();
    bob[i].move();
  }
  for(int i = 0; i < 2; i++){
    joe[i].show();
    joe[i].move();
  }
}

class meteor{
  float myX1, myY1, myX2, myY2, mySpeed, offset, theta, radius;
  color myColor;
  meteor(){
    myColor = color((int)(Math.random() * 100 + 175), (int)(Math.random() * 100 + 175), (int)(Math.random() * 100 + 175));
    offset = 500;
    theta = (float)(Math.random() * 2 * PI);
    radius = (float)(Math.random() * 600);
    //length = 0;
    mySpeed = 1;
    myX1 = cos(theta) * radius + offset;
    myY1 = sin(theta) * radius + offset;
    myX2 = myX1;
    myY2 = myY1;
  }
  
  void move(){
    myX1 = myX1 + cos(theta) * mySpeed;
    myY1 = myY1 + sin(theta) * mySpeed;
    myX2 = myX1 + cos(theta) * mySpeed * 10;
    myY2 = myY1 + sin(theta) * mySpeed * 10;
    mySpeed = mySpeed + 0.1;
    if(myX1 > 1000 || myX1 < -1000){
      theta = (float)(Math.random() * 2 * PI);
      radius = 0;
      mySpeed = 1;
      myX1 = cos(theta) * radius + offset;
      myY1 = sin(theta) * radius + offset;
      myX2 = myX1;
      myY2 = myY1;
    }
  }

  void show(){
    stroke(myColor);
    strokeWeight(3);
    //ellipse(myX1, myY1, 10, 10);
    line(myX1, myY1, myX2, myY2);
  }
}

class oddBall extends meteor{
  oddBall(){
    mySpeed = 1;
    offset = 500;
    radius = 100;
    theta = (float)(Math.random() * 2 * PI);
    myColor = color((int)(Math.random() * 100 + 175), (int)(Math.random() * 100 + 175), (int)(Math.random() * 100 + 175));
    myX1 = (float)(Math.random()* 250) + 250;
    myY1 = (float)(Math.random()* 250) + 250;
  }
  
  void move(){
    myX1 = 250 * cos(theta) + 500;
    myY1 = 250 * sin(theta) + 500;
    theta = theta + 0.1;
  }

  void show(){
    fill(200, 0, 0);
    ellipse(myX1, myY1, 30, 30);
  }
}
