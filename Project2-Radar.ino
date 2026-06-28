#include <Servo.h>
Servo servo;
const int trigPin = 10; // ascribes the trigPin to DigiPin 10
const int echoPin = 11;//ascribes the echoPin to DigiPin 11

void setup() {
  servo.attach(9);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  for (int i = 0; i <= 180; i++) { // 
    servo.write(i); // turn servo all angles from 0 -> 180
    delay(15); // delay 15 milliseconds between each turn
   if (i % 6 == 0){ // for every 6th degree
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);  // fire the sensor
    long duration = pulseIn(echoPin, HIGH);
    float distance_cm = (duration * 0.0343) / 2; // calculate the distance in cm
    Serial.print(i);
    Serial.print(",");
    Serial.println(distance_cm);} // print the serial 
  }
  for (int i = 180; i >= 0; i--) {
    servo.write(i); // turn servo all angles from 180 -> 0 
    delay(15); // delay 15 milliseconds between each turn
  if (i % 6 == 0){// for every 6th degree
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);// fire the sensor
    long duration = pulseIn(echoPin, HIGH);
    float distance_cm = (duration * 0.0343) / 2;// calculate the distance in cm
    Serial.print(i);
    Serial.print(",");
    Serial.println(distance_cm);}// print the serial 
  }
}