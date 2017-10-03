Particle [] particles = new Particle[0];
boolean charge1 = true;
boolean charge2 = true;
boolean mouseCharge = true;
int count = 0; 
int startX,startY,startX2;
void setup()   
{     
 	size(600,400); 
}   
void draw()   
{    
 	background(1);
 	textSize(30);
 	if(charge1){
 		fill(0,0,255);
 		rect(0,0,600,100);
 		fill(0);
 		text("S",300,50);
 	}
 	else if(!charge1){
 		fill(255,0,0);
 		rect(0,0,600,100);
 		fill(0);
 		text("N", 300,50);
 	}
 	
 	if (charge2) {
 		fill(0,0,255);
 		rect(0,300,600,100);
 		fill(0);
 		text("S",300,350);
 	}
 	else if(!charge2) {
 		fill(255,0,0);
 		rect(0,300,600,100);
 		fill(0);
 		text("N", 300,350);
 	}
 	for(int i=0; i<particles.length; i++) {
	    particles[i].move();
	    particles[i].show();
	    startX = particles[i].myX + particles[i].mySize/2;
	    startY = particles[i].myY;
	    startX2 = particles[i].myX - particles[i].mySize/2;
	    stroke(255,255,0);
	    if(get(startX + 10, startY) != color(1)){
	    	line(startX, startY,startX + 2, startY - 2);
	    	line(startX + 2, startY - 2, startX + 4, startY);
	    	line(startX + 4, startY, startX + 6, startY + 2);
	    	line(startX + 6, startY + 2, startX + 8, startY);
	    	line(startX + 8, startY, startX + 10, startY - 2);
	    }
	    if(get(startX2 - 10, startY) != color(1)){
	    	line(startX2, startY,startX2 - 2, startY - 2);
	    	line(startX2 - 2, startY - 2, startX2 - 4, startY);
	    	line(startX2 - 4, startY, startX2 - 6, startY + 2);
	    	line(startX2 - 6, startY + 2, startX2 - 8, startY);
	    	line(startX2 - 8, startY, startX2 - 10, startY - 2);
	    }
	    /*
	    point(particles[i].myX + particles[i].mySize/2 + 10, particles[i].myY);
	    point(particles[i].myX - particles[i].mySize/2 - 10, particles[i].myY);
	    */
	}

 }  
class Particle    
{     
 	int myX,myY,mySize;
 	boolean myCharge;
 	Particle(int x, int y, boolean charge)
 	{
 		myX = x;
 		myY = y;
 		myCharge = charge;
 		mySize = 20;
 	}  

 	void show(){
 		fill(255);
 		stroke(0);
 		ellipse(myX,myY,mySize,mySize);
 		fill(0);
 		textSize(14);
 		textAlign(CENTER,CENTER);
 		if(myCharge){
 			text("+",myX+ mySize/20 ,myY - mySize/10);
 		}
 		else{
 			text("-",myX + mySize/20,myY - mySize/10);
 		}
 	}
 	void move(){
 		
 		if(dist(myX,myY,0,myY) > 9 && dist(myX,myY,600,myY) > 9){
 			if(myCharge == mouseCharge && dist(myX,myY,mouseX,myY) < 20){
 				myX = myX + ((int)(Math.random() * 5) - 3)/2;
 			}
			else if(myCharge == mouseCharge && dist(myX,myY,mouseX,myY) < 30){
				myX = myX + ((int)(Math.random() * 5) - 1)/2;
			}
			else if(myCharge != mouseCharge && dist(myX,myY,mouseX,myY) < 30){
				myX = myX + ((int)(Math.random() * 5) - 1)/2;
			}
			else if(myCharge != mouseCharge && dist(myX,myY,mouseX,myY) < 30){
				myX = myX + ((int)(Math.random() * 5) - 3)/2;
			}
			else{
				myX = myX + (int)(Math.random() * 3) - 1;
			}

 		}

 		if(dist(myX,myY,myX,0) > 109 && dist(myX,myY,myX,400) > 109){
	 		if(charge1 == charge2){
		 		myY = myY + (int)(Math.random() * 3) - 1 ;
		 	}
		 	if(charge1 == myCharge && charge2 != myCharge){
		 		myY = myY + ((int)(Math.random() * 5) - 3)/2;
		 	}
		 	if(charge1 != myCharge && charge2 == myCharge){
		 		myY = myY + ((int)(Math.random() * 5) - 1)/2;
		 	}
		 }
		 if(myY + mySize/2 >= 300){
		 	myY = 299 - mySize/2;
		 }
		 if(myY - mySize/2 <= 100){
		 	myY = 101 + mySize/2;
		 }
		 if(myX - mySize/2 < 0){
		 	myX = 1 + mySize/2;
		 }
		 if(myX + mySize/2 > 600){
		 	myX = 599 - mySize/2;
		 }
		
 	}
}   

void mousePressed(){
	if(mouseX < 600 && mouseX > 0 && mouseY < 100 && mouseY > 0 && charge1 == true){
		charge1 = false;
		pushBack();
	}
	else if(mouseX < 600 && mouseX > 0 && mouseY < 100 && mouseY > 0 && charge1 == false){
		charge1 = true;
		pushBack();
	}
	
	if(mouseX < 600 && mouseX > 0 && mouseY < 400 && mouseY > 300 && charge2 == true){
		charge2 = false;
		pushBack();
	}
	else if(mouseX < 600 && mouseX > 0 && mouseY < 400 && mouseY > 300 && charge2 == false){
		charge2 = true;
		pushBack();
	}

	if(mouseY < 300 && mouseY > 100){
		newParticle(mouseX,mouseY);
	}
}

void newParticle(int x, int y){
	count = count + 1;
	particles = (Particle[])(expand(particles,count));
	particles[count - 1] = new Particle(x,y,Math.random() < .5) ;
}

void pushBack(){
	for(int i=0; i<particles.length; i++) {
		if(particles[i].myY <= 110){
			particles[i].myY = 111;
		}
		if(particles[i].myY >= 290){
			particles[i].myY = 289;
		}
	}
}