//The Blind Dragon by Paolo Duran
/*
  Requirements:
  Canvas size of 1080x720
  At least 3 different types of primitives
  Variation in stroke weight and fill color
  A title for the drawing
*/

//set canvas size to 1080x720
size(1080, 720);

//set background color to black
background(0, 0, 0);

//Blindfold
fill(0, 0, 50.2);//fill color set to navy blue
stroke(153, 101, 21);//stroke to golden brown
strokeWeight(5);
rect(135, 345, 810, 195, 7);

//Blindfold Design
fill(197, 179, 88);//fill to gold
stroke(197, 179, 88);//stroke to gold
strokeWeight(19);
quad(549, 560, 549, 530, 704, 345, 704, 375);//right
quad(531, 560, 531, 530, 376, 345, 376, 375);//left

//echo
stroke(107, 202, 226);
strokeWeight(2);
noFill();
circle(540, 180, 270);
circle(540, 180, 180);
circle(540, 180, 90);
