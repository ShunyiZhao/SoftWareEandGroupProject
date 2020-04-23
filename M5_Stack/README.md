# TEAM6 BIG EATER - M5 Stack and Serial Communication

## M5 Stack - senors

The Ardunio API webpage of M5 Stack:

[M5 Stack Ardunio API](https://docs.m5stack.com/#/en/arduino/arduino_api)

We used API functions of IMU(Sensor MPU9250) to get the accelerations and Euler Angels. These parameters are organised in a string, with spaces between them. At the end of this string, a character is sent to send button signal.

## M5 Stack - Serial Communication

A simple function called Serial.print() is used to send the string above.

Communication Protocol:
> add some characters at the end of string

## Processing - Serial Communication

We use a function caller xxx to listen the string sent by M5 Stack.

## Processing - Character Control

Due to an unknown problem, the yaw angle of this sensor added automaticlly. So although We have complete a series of simple version codes of matrix computation, we can not ues them to calculate the true acceleration of the movements. So We used accelerations caused by angles and gravity to control the characters in processing.