# TEAM6 BIG EATER - M5 Stack and Serial Communication

## M5 Stack - senors

The Ardunio API webpage of M5 Stack:

[M5 Stack Ardunio API](https://docs.m5stack.com/#/en/arduino/arduino_api)

We used API functions of IMU(Sensor MPU9250) to get the accelerations and Euler Angels. These parameters are organised in a string, with spaces between them. At the end of this string, a character is set to send button signal. 

## M5 Stack - Serial Communication

A simple function called Serial.print() is used to send the string.
The format of this string is shown below:

![command string](./images/image_4.png)

In this string, the letter 'b' represents the button of the Stack. If the first button is pressed, this letter will be changed to 'a',
shown below:

![button press](./images/image_5.png)

At the end of this string, a letter 'q' is sent to represent the end of this string.

In the middle of this string, six numbers represent 3 posture angles and 3 accelerations are split by space characters, which are placed 
to distinguish these numbers.

In these two images, a problem which will be described detailed in the section [Problems and Limitations](#limitations)

These string will be sent to the USB buffer.

## Processing - Serial Communication

We use a function Class Serial.readStringUntil() to listen the string sent by M5 Stack. In the above string, the letter 'q' is the symbol 
of the end of one commmand.

In the first one hundred loop getting loops, perhaps the connection between the Stack and Desktop Application has not been built, so the
processing programme will wait to this connection, and print "loop" to the command line. After getting this string, the processing programme will devide it to 6 substrings, and the letter 'q' will be removed from this string.

## Processing - Character Control

Due to an unknown problem, the yaw of this sensor increases automaticlly. Although we have completed a series of simple version codes of matrix computation, we can not use them to calculate the true acceleration of the movements. So we used accelerations caused by angles and gravity to control the character in processing.

We use a rectangle to simulate the character, and a circle is uesd to represent the pointer.

The inital Interface of this communication program is shown below:

![inital interface](./images/image_2.png)

If the user slope Stack to left, the rectangle will move to left side:

![move left](./images/image_6.png)

When user press the first button on the Stack, the programme will check the state of the rectangle which represent the character, 
The defenifion of character states is
> 0, the rectangle move
> 1, the circle move
The programme will switch between this two states. In state1, the rectangle will not move, and the circle can move four directions.

![circle state](./images/image_3.png)

### Space Coordinate transformation
The main works are in the file called [communication.pde](./communication/communication.pde) and [simpleMat.pde](./communication/simpleMat.pde)


We planned to use the posture angles to transform the accelerations to ground coordinate system. 

The rotation and translation matrix is shown below:

![matrix_1](./images/matrix_1.svg)

Cite from wikepedia - [wikepedia matrix](https://en.wikipedia.org/wiki/Rotation_matrix)

In these two files above, some functions are used to transfrom the coordinate.

### Combine M5 Stack with Desktop Application
The video below shows the game which combine the Desktop Application and M5 Stack.
[The link to video](./piece.mp4)

## <span id="limitations">Problems and Limitations
One of the angle increase or decrease itself, shown in images below:

![image_1](./images/image_1.png)

![image_2](./images/image_2.png)

After about 10 seconds, it changed from -163 to -172.