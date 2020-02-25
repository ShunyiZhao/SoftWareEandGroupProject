class RectButton{
    int x;
    int y;
    int width;
    int height;
    int thisWeight;
    RGBColour strokeColor;
    RGBColour buttonColor;
    
    RectButton(int setX, int setY, int setWidth, int setHeight,int setWeight, RGBColour setColour, RGBColour setStrokeColour){
        x = setX;
        y = setY;
        width = setWidth;
        height = setHeight;
        thisWeight = setWeight;
        buttonColor = new RGBColour(setColour.readR(), setColour.readG(), setColour.readB());
        strokeColor = new RGBColour(setStrokeColour.readR(), setStrokeColour.readG(), setStrokeColour.readB());
    }
    
    void draw(){
        stroke(strokeColor.readR(), strokeColor.readG(), strokeColor.readB());
        
        strokeWeight(thisWeight);
        noFill();
        //fill(buttonColor.readR(), buttonColor.readG(), buttonColor.readB());
        rect(x, y, width, height);
    }
    
    boolean checkClickArea(){
        if(mouseX >= x && mouseX < (x + width) && mouseY > y && mouseY < (y + height)){
            return true;
        }
        return false;
    }
    
    
}
