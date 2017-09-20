Particle proton;
Particle electron;
boolean charge1 = true;  
void setup()   
{     
 	size(600,400);
 	
 	proton = new Particle(300,200, "+");
 	electron = new Particle(200,200,"_");   
}   
void draw()   
{    
 	background(204,229,255);
 	textSize(30);
 	if(charge1){
 		fill(0,0,255);
 		rect(0,0,600,100);
 		fill(0);
 		text("S",300,50);
 	}
 	else{
 		fill(255,0,0);
 		rect(0,0,600,100);
 		fill(0);
 		text("N", 300,50);
 	}
 	
 	proton.show();
 	proton.move();
 	electron.show();
 	electron.move();
 }  
class Particle    
{     
 	int myX,myY,mySize;
 	String myCharge;
 	Particle(int x, int y, String charge)
 	{
 		myX = x;
 		myY = y;
 		myCharge = charge;
 		mySize = 20;
 	}  

 	void show(){
 		fill(255);
 		ellipse(myX,myY,mySize,mySize);
 		fill(0);
 		textSize(14);
 		textAlign(CENTER, CENTER);
 		text(myCharge,myX ,myY);
 	}
 	void move(){
 		myX = myX + (int)(Math.random() * 3) - 1;
 		myY = myY + (int)(Math.random() * 3) - 1;
 	}
}   

void mousePressed(){

}