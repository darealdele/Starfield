
Particle [] particles;
void setup()
{
  background(20);
  size(500,500);
  particles = new Particle[500];
  for(int i = 0; i<particles.length; i++){
    if(i == 0){
      particles[i] = new OddBallParticle();  
    }
    else{
      particles[i] = new Particle();
    }
  }
  
}
void draw()
{
  background(0);
  fill(255);
  rect(50,225,70,50);
  arc(55,275,100,100,PI,(PI*3)/2);
  fill(95,168,203);
  arc(40,250,50,40,PI,(PI*3)/2,PIE);
  fill(255);
  beginShape();
  vertex(120,225);
  vertex(150,235);
  vertex(150,265);
  vertex(120,275);
  endShape();
  for(int i = 0; i<particles.length;i++){
    particles[i].show();
    particles[i].move();
  }
}
class Particle
{
  int partColor = color(203,95,95);
  double myX,myY,myAngle,mySpeed;
  Particle(){
    myX = 145;
    myY = 250;
    myAngle = -(Math.random()*2) + 1;
    mySpeed = (Math.random()*4)+1;
  }
  void move(){
    if(myX > 500){
      myX = 145;
      myY = 250;
    }
    else if(myY > 500 || myY < 0){
      myY = 250;  
      myX = 145;
    }
    else{
      myX += (Math.cos(myAngle)) * mySpeed;   
      myY += (Math.sin(myAngle)) * mySpeed;   
    }
  }
  void show(){
    fill(partColor);
    ellipse((float)(myX),(float)(myY),15,15);  
  }
}

class OddBallParticle extends Particle//inherits from Particle
{
  OddBallParticle(){
    myX = 145;
    myY = 250;
    myAngle = -(Math.random()*2) + 1;
    mySpeed = (Math.random()*4)+1;    
  }
  void show(){
    fill(0,255,0);
    rect((float)(myX),(float)(myY),35,35);  
  }
}


