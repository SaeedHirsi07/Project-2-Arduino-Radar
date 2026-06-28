
import processing.serial.*;
int angle;
float distance, x, y;
int lastClear = 0;


Serial serial;
void setup(){
  background(0); // sets background colour (black)
size(1200, 900); // size of drawing in pixels
println(Serial.list());
serial = new Serial(this, Serial.list()[3], 9600);// opens up a list of all serials and prints only the ones from the elegoo 
}

void draw(){
translate(600, 770); // move the origin down to the bottom centre
stroke(0, 255, 0); // green for the coloring of the lines 

noFill(); arc(0,0,1100,1100,-PI,0); // 100cm
text("100cm", 0, -555);
noFill(); arc(0,0,825,825,-PI,0);// 75cm
text("75cm", 0, -400);
noFill(); arc(0,0,550,550,-PI,0);// 50cm
text("50cm", 0, -255);
noFill(); arc(0,0,275,275,-PI,0);// 25 cm
text("25cm", 0, -146);
String value = serial.readStringUntil('\n'); // reads incoming values from elegoo and ascribes it to 'value'
if (value != null) {
  if (angle == 0|| angle == 180){ background (0);} // reset the image whenever a new sweep begins 
  String[] parts = split(value, ',');
  if (parts.length >= 2) {
    angle = int(parts[0]);
    distance = float(parts[1]); // the serial has 2 numbers to it, split them up and make the first one equal to angle and the second one equal to distance in cm
   float scaled = (distance / 100.0) * 550; // scale the distace to the drawn arcs
x = scaled * cos(radians(angle));
y = -(scaled * sin(radians(angle))); //calculate the length of the lines
   strokeWeight(5);// increase the thickness of lines 
   if (distance < 100) {
  stroke(255, 0, 0);
     line(0, 0, x, y); // only show distances within 100 cm and make them red
}

   
  }
}

}
