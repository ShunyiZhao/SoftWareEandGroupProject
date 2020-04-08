//import processing serial

import processing.serial.*;

Serial port_1;

float InitAngle[] = {0, 0, 0};

int rect_x, rect_y;

int rectWidth = 20, rectHeight = 20;
float speed_x = 0.0, speed_y = 0.0;

void setup(){
    port_1 = new Serial(this, "COM5", 115200);
    size(1280, 720);
    while(true){
        String inputString = port_1.readStringUntil('q');
        println("loop");
        if(inputString != null){
            //Init angles
            String[] data = inputString.split(" ");
            InitAngle[0] = Float.parseFloat(data[0]);
            InitAngle[1] = Float.parseFloat(data[1]);
            InitAngle[2] = Float.parseFloat(data[2]);
            println(InitAngle);
            //println("break");
            //delay(5500);
            break;
        }
    }
    textSize(16);
    rect_x = 1280 / 2;
    rect_y = 720 / 2;
}

void draw(){
    if(port_1.available() > 0){
        String inputString = port_1.readStringUntil('q');
        String[] datas = inputString.split(" ");
        //split String and do some other things
        datas[5] = datas[5].substring(0, datas[5].length() - 1);
        //println(datas[5]);
        println(inputString);
        float[] fdatas = {0, 0, 0, 0, 0, 0};
        fdatas[0] = Float.parseFloat(datas[0]);
        fdatas[1] = Float.parseFloat(datas[1]);
        fdatas[2] = Float.parseFloat(datas[2]);
        fdatas[3] = Float.parseFloat(datas[3]);
        fdatas[4] = Float.parseFloat(datas[4]);
        fdatas[5] = Float.parseFloat(datas[5]);
        float[] finalAccs = convertCoorSystem(fdatas);
        //delay(50);
        //draw a rect
        rect(rect_x, rect_y, rectHeight, rectWidth);
        float dis_1 = finalAccs[0] - fdatas[3];
        float dis_2 = finalAccs[1] - fdatas[4];
        float dis_3 = finalAccs[2] - fdatas[5];

        //println(dis_1 + " , " + dis_2 + " , " + dis_3);
        /*dis_1 = dis_1 * 9.8;
        if(abs(dis_1) > 1){
            speed_x += dis_1;
        }*/
        //println( speed_x + "         " + rect_x + "         " + rect_y)
        //rect_x += speed_x;
        if(fdatas[3] > 0.2 || fdatas[3] < -0.2){
            rect_x -= fdatas[3] * 20;
        }
        background(0);
        text(finalAccs[0], 200, 140);
        text(fdatas[3], 200, 160);
        text(dis_1, 200, 180);
        text(rect_x, 200, 200);
        text(speed_x, 200, 220);
        rect(rect_x, rect_y, rectHeight, rectWidth);
        //add the function of button on M5 Stack

    }
}

float[] convertCoorSystem(float[] datas){
    float[] finalDatas = {0, 0, 0};
    ArrayList<ArrayList<Float>> rollData = calRollMat(datas);
    ArrayList<ArrayList<Float>> pitchData = calPitchMat(datas);
    simpleMat graMat = getGravityMat();
    //graMat.printDatas();
    simpleMat matRoll = new simpleMat(3, 3, rollData);
    simpleMat matPitch = new simpleMat(3, 3, pitchData);
    //matRoll.printDatas();
    //println("-----------");
    //matPitch.printDatas();
    //println("-----------");
    simpleMat product_1 = matRoll.calMatProduct(graMat);
    simpleMat product_2 = matPitch.calMatProduct(product_1);
    //product_1.printDatas();
    //println("----------");
    //product_2.printDatas();
    finalDatas[0] = product_2.getDatas().get(0).get(0);
    finalDatas[1] = product_2.getDatas().get(1).get(0);
    finalDatas[2] = product_2.getDatas().get(2).get(0);
    //println(finalDatas);
    return finalDatas;
}

simpleMat getGravityMat(){
    ArrayList<ArrayList<Float>> graData = new ArrayList<ArrayList<Float>>();
    
    ArrayList<Float> row_1 = new ArrayList<Float>();
    row_1.add(0.0);
    graData.add(row_1);
    
    ArrayList<Float> row_2 = new ArrayList<Float>();
    row_2.add(0.0);
    graData.add(row_2);
    
    ArrayList<Float> row_3 = new ArrayList<Float>();
    row_3.add(1.0);
    graData.add(row_3);
    
    return new simpleMat(3, 1, graData);
}

ArrayList<ArrayList<Float>> calRollMat(float[] datas){
    ArrayList<ArrayList<Float> > rollData = new ArrayList<ArrayList<Float>>();
    ArrayList<Float> row_1 = new ArrayList<Float>();
    row_1.add(1.0);
    row_1.add(0.0);
    row_1.add(0.0);
    rollData.add(row_1);
    
    ArrayList<Float> row_2 = new ArrayList<Float>();
    row_2.add(0.0);
    float disAngle = datas[1] - InitAngle[1];
    disAngle = - disAngle / 360;
    disAngle = disAngle * 2 * 3.1415926535897;
    row_2.add(cos(disAngle));
    row_2.add(-sin(disAngle));
    rollData.add(row_2);
    
    ArrayList<Float> row_3 = new ArrayList<Float>();
    row_3.add(0.0);
    row_3.add(sin(disAngle));
    row_3.add(cos(disAngle));
    rollData.add(row_3);
    
    
    return rollData;
}

ArrayList<ArrayList<Float>> calPitchMat(float[] datas){
    ArrayList<ArrayList<Float> > pitchData = new ArrayList<ArrayList<Float>>();
    float disAngle = datas[0] - InitAngle[0];
    disAngle = - disAngle / 360;
    disAngle = disAngle * 2 * 3.1415926535897;
    
    ArrayList<Float> row_1 = new ArrayList<Float>();
    row_1.add(cos(disAngle));
    row_1.add(0.0);
    row_1.add(sin(disAngle));
    pitchData.add(row_1);
    
    ArrayList<Float> row_2 = new ArrayList<Float>();
    row_2.add(0.0);
    row_2.add(1.0);
    row_2.add(0.0);
    pitchData.add(row_2);
    
    ArrayList<Float> row_3 = new ArrayList<Float>();
    row_3.add(-sin(disAngle));
    row_3.add(0.0);
    row_3.add(cos(disAngle));
    pitchData.add(row_3);
    
    
    return pitchData;
}
