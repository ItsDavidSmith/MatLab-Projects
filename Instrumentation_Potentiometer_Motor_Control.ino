#define POTENTIOMETER_PIN A0 //Sets Analog Data Pin from potentiometer on Arduino as A0
#include "Stepper.h" // Stepper Class
//#include "IRremote.h" IR Remote class if we implement
Stepper mySTEPPER(2048,8,10,9,11);
int STEPPER_STEPS; //Variable that will tell motor how many steps to take
int STEPPER_SPEED = 17; // Maximum Roles per minute is 17 for this motor
int POTENTIOMETER_VALUE = 0; //Creates Integer for Value of potentiometer reading, easier to use later
int PAST_VAL = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  mySTEPPER.setSpeed(STEPPER_SPEED); //Sets the motor speed
  POTENTIOMETER_VALUE = analogRead(POTENTIOMETER_PIN); //Assigns value of reading to VALUE variable
  Serial.println(POTENTIOMETER_VALUE); //Prints VALUE
  mySTEPPER.step(POTENTIOMETER_VALUE*2);//MOVE MOTOR TO THIS POSITION FIRST, Motor counts are up to 2048 while poten. are up to 1023(roughly half so *2)
}
//SEVENTEEN RPM ADJUST DELAY TIME FOR LOOP ACCORDINGLY
void loop() {
  // put your main code here, to run repeatedly:
  PAST_VAL = POTENTIOMETER_VALUE;
  POTENTIOMETER_VALUE = analogRead(POTENTIOMETER_PIN);
  Serial.println(POTENTIOMETER_VALUE);

  if (PAST_VAL - POTENTIOMETER_VALUE > 9 || PAST_VAL - POTENTIOMETER_VALUE < (-9)  )
  {
  mySTEPPER.step(-(PAST_VAL - POTENTIOMETER_VALUE)*2);
  }
  delay(100); // Completes Task first then Waits 0.1 SecDa
}