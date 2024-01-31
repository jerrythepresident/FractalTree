private double fractionLength = .8; 
private int smallestBranch = 12; 
private double branchAngle = .4;  
public void setup() 
{   
  size(640, 480);    
  noLoop();
  stroke(0,0,0);
} 
public void draw() 
{   
  background(0);  
  line(320, 480, 320, 380);   
  drawBranches(320, 380, 100, 3*Math.PI/2);  //will add later
} 
public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  stroke(255,255,255);
  double angle1, angle2;
  angle1 = (10-Math.random())/9.5*(angle+branchAngle);
  angle2 = (10-Math.random())/9.5*(angle-branchAngle);
  branchLength = branchLength*fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if (branchLength>smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
