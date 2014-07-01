//SAMPLE CODE TO DEMONSTRATE ONE WAY OF RECOGNISING MULTIPLE KEY PRESSES
//the solution was stolen from somewhere (can't remember where!) and adapted.
//TRISTAN MILLER 2014 tristan dot miller atmark asms dot sa dot edu dot au




boolean[] downKeys = new boolean[256]; //declare an ARRAY of booleans
                                       //effectively a row of 256 switches that can off or on
void setup(){  //runs ONCE
  size(400,400);
  background(0);
  noStroke();
}


void draw(){   //runs REPEATEDLY (approx 60 times per second)

background(255);

  if(downKeys[97]||downKeys[65]){ //if A or a is pressed, draw a red rectangle (slightly transparent)
    fill(255,0,0,100);
    rectMode(CENTER);
    rect(width/2,height/2,width,height);
  } 
  
  if(downKeys[115]||downKeys[83]){ //if S or s is pressed, draw a green ellipse (slightly transparent)
    fill(0,255,0,100);
    ellipseMode(CENTER);
    ellipse(width/2,height/2,width,height);
  } 
  
    if(downKeys[100]||downKeys[68]){ //if D or d is pressed, draw a blue diamond (slightly transparent)
    fill(0,0,255,100);
    rectMode(CENTER);
    pushMatrix();    //here's some code for rotating the coordinate system so I can just draw a square at a jaunty angle!
      translate(width/2,height/2);
      rotate(radians(45));
      rect(0,0,width/1.4,height/1.4);
    popMatrix();  
  } 
  
  textSize(32);
  textAlign(CENTER);
  pushMatrix();
    translate(width/2, height/2);
    fill(0);
    text("Press A or S or D",0,0);   
  popMatrix();
  

 
}


void keyPressed() {
 if (key<256) {  //if a key is pressed, and its numerical code is less than 256,
   downKeys[key] = true;  //set the corresponding element of downKeys to 'true'
     for(int i = 0; i< downKeys.length; i++){
     if(downKeys[i]){  
       println(i);
       } //this FOR LOOP is optional...it goes through the downKeys array
         //one entry at a time, and if it encounters a 'true' (which corresponds to a pressed key)
         //it prints the value of the key to the console (below), using the println() function.
         //This is useful for working out the numerical code for particular keys.
         //For instance, 'space' is 32.
   }
     
 }
}

void keyReleased() { //this function returns elements of downKeys to 'false'
 if (key<256) {      //if a change in the key's state is detected.
   downKeys[key] = false;
   println(0);
  }
}
