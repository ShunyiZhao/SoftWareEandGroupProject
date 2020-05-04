# TEAM6 BIG EATER - M5 Stack and Serial Communication

## M5 Stack - senors

The Ardunio API webpage of M5 Stack:

[M5 Stack Ardunio API](https://docs.m5stack.com/#/en/arduino/arduino_api)

We used API functions of IMU(Sensor MPU9250) to get the accelerations and Euler Angels. These parameters are organised in a string, with spaces between them. At the end of this string, a character is set to send button signal. 

## M5 Stack - Serial Communication

A simple function called Serial.print() is used to send the string.

Communication Protocol:
> add a special letter at the end of string, and then use this letter to read the whole line in processing programme.
> split the string by the space character.

These string will be sent to the USB buffer, so perhaps some commands will accumulate in the buffer.

## Processing - Serial Communication

We use a function Class Serial.readStringUntil() to listen the string sent by M5 Stack. In the above string, the letter 'q' is the symbol 
of the end of one commmand.

## Processing - Character Control

Due to an unknown problem, the yaw of this sensor increases automaticlly. So although We have complete a series of simple version codes of matrix computation, we can not ues them to calculate the true acceleration of the movements. So We used accelerations caused by angles and gravity to control the characters in processing.

### Space Coordinate transformation
The main works are in the file called communication.pde
- [communication.pde](./communication/communication.pde)


We planned to use the posture angles to transform the accelerations to ground coordinate system. 

The rotation and translation matrix is shown below:

![matrix_1](./images/matrix_1.svg)

Cite from wikepedia - [wikepedia matrix](https://en.wikipedia.org/wiki/Rotation_matrix)

### Combine M5 Stack with Desktop Application


## Problems Found in This Project
one of the angle increase itself, shown in below image:
![image_1](./images/image_1.png)

![image_2](./images/image_2.png)
