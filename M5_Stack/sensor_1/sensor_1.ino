/*first try about sensor*/
#define M5STACK_MPU6886

#include<M5Stack.h>

float accX = 0.0;
float accY = 0.0;
float accZ = 0.0;

float angle_1 = 0;
float angle_2 = 0;
float angle_3 = 0;

int pos[3] = {0, 0, 0};
float speedXY[4] = {0, 0, 0, 0};
int currPos[2] = {155, 115};


void setup() {
  // put your setup code here, to run once:
  M5.begin();

  M5.Power.begin();
  M5.IMU.Init();
  M5.Lcd.fillScreen(BLACK);
  M5.Lcd.setTextColor(GREEN, BLACK);
  M5.Lcd.setTextSize(2);
}

void loop() {
  // put your main code here, to run repeatedly:
  M5.IMU.getAccelData(&accX, &accY, &accZ);
  M5.IMU.getAhrsData(&angle_1, &angle_2, &angle_3);

  float temSpeedX = accX * 10;
  float temSpeedY = accY * 10;

  float avgSpeedX = (temSpeedX + speedXY[0]) / 2;
  float avgSpeedY = (temSpeedY + speedXY[2]) / 2;

  int disX = avgSpeedX * 2;
  int disY = avgSpeedY * 2;

  currPos[0] -= disX;
  if(currPos[0] < 0){
    currPos[0] = 0;
  }
  if(currPos[0] > 310){
    currPos[0] = 309;
  }
  currPos[1] += disY;
  if(currPos[1] < 0){
    currPos[1] = 0;
  }
  if(currPos[1] > 230){
    currPos[1] = 229;
  }
  
  drawRect(10, 10);
  char strOutput_1[50];
  char strOutput_2[50];
  if (M5.BtnA.wasReleased()){
    sprintf(strOutput_1, "a%f %f %f ", angle_1, angle_2, angle_3);
    sprintf(strOutput_2, "%f %f %fq", accX, accY, accZ);
  }
  else {
    sprintf(strOutput_1, "b%f %f %f ", angle_1, angle_2, angle_3);
    sprintf(strOutput_2, "%f %f %fq", accX, accY, accZ);  
  }
  Serial.print(strOutput_1);
  Serial.print(strOutput_2);
  
  delay(1);
}

void drawRect(int LengthX, int LengthY){
  M5.Lcd.fillScreen(BLACK);
  M5.Lcd.setCursor(currPos[0], currPos[1]);

  M5.Lcd.drawRect(currPos[0], currPos[1], LengthX, LengthY, BLUE);
  
}
