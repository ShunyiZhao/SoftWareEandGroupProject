//RectButton button1;
States[] machineStates;
States currState;

void setup(){
    PImage temImage;
    temImage = loadImage("image_0.jpg");
    //println(temImage.width + ", " + temImage.height);
    size(1440, 1080);
    //button1 = new RectButton(width/2, height/2, 50, 50, 2, new RGBColour(0, 0, 255), new RGBColour(0, 0, 255));
    machineStates = new States[10];
    //State_0
    machineStates[0] = new States("image_0.jpg", 2, 0);
    machineStates[0].createButton(new RectButton(995, 300, 86, 77, 0, new RGBColour(255, 255, 255), new RGBColour(0, 0, 0)), 0, 1);
    machineStates[0].createButton(new RectButton(457, 530, 197, 77, 0, new RGBColour(255, 255, 255), new RGBColour(0, 0, 0)), 1, 3);
    //State_1
    machineStates[1] = new States("image_1.jpg", 1, 1);
    machineStates[1].createButton(new RectButton(427, 377, 30, 30, 2, new RGBColour(255, 255, 255), new RGBColour(0, 0, 0)), 0, 0);
    //State_2
    machineStates[2] = new States("image_2.jpg", 0, 2);
    //State_3
    machineStates[3] = new States("image_3.jpg", 0, 3);
    //State_4
    machineStates[4] = new States("image_4.jpg", 0, 4);
    //State_5
    machineStates[5] = new States("image_5.jpg", 0, 5);
    //State_6
    machineStates[6] = new States("image_6.jpg", 1, 6);
    machineStates[6].createButton(new RectButton(427, 377, 30, 30, 2, new RGBColour(0, 0, 0), new RGBColour(0, 0, 0)), 0, 7);
    //State_7
    machineStates[7] = new States("image_7.jpg", 0, 7);
    //State_8
    machineStates[8] = new States("image_8.jpg", 1, 8);
    machineStates[8].createButton(new RectButton(890, 430, 30, 30, 2, new RGBColour(0, 0, 0), new RGBColour(0, 0, 0)), 0, 9);
    //State_9
    machineStates[9] = new States("image_9.jpg", 0, 9);
    //currState
    currState = machineStates[0];
}

void draw(){
    //button1.draw();
    currState.showState();
}

void mousePressed(){
    /*if(mouseButton == LEFT){
        if(button1.checkClickArea()){
            println("---------------");
        }
        else{
            println("***************");
        }
    }*/
    if(currState.readID() == 3){
        currState = machineStates[4];
    }
    else if(currState.readID() == 4){
        currState = machineStates[5];
    }
    else if(currState.readID() == 5){
        currState = machineStates[6];
    }
    else if(currState.readID() == 7){
        currState = machineStates[8];
    }
    else if(currState.readID() == 9){
        currState = machineStates[2];
    }
    else if(currState.readID() == 2){
        currState = machineStates[0];
    }
    println(mouseX + "," + mouseY);
    int n = currState.checkClickNextState();
    currState = machineStates[n];
    
}
