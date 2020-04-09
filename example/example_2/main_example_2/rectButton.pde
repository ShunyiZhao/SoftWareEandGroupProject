class rectButton extends Button{
    private int startPoint_x;
    private int startPoint_y;
    private int rectWidth;
    private int rectHeight;
    
    rectButton(int inputX, int inputY, int inputWidth, int inputHeight, int inputWeight, RGBColour inputStrokeColour, RGBColour inputBColour){
        super(inputWeight, inputStrokeColour, inputBColour);
        startPoint_x = inputX;
        startPoint_y = inputY;
        rectWidth = inputWidth;
        rectHeight = inputHeight;
    }
    
    rectButton(int inputX, int inputY, int inputWidth, int inputHeight){
        super();
        startPoint_x = inputX;
        startPoint_y = inputY;
        rectWidth = inputWidth;
        rectHeight = inputHeight;
    }
    
    public void drawButton(){
        stroke(strokeColour.readR(), strokeColour.readG(), strokeColour.readB());
        strokeWeight(thisWeight);
        noFill();
        //fill(buttonColor.readR(), buttonColor.readG(), buttonColor.readB());
        rect(startPoint_x, startPoint_y, rectWidth, rectHeight);
    }
    
    public boolean checkClickArea(){
        if(mouseX >= startPoint_x && mouseX < (startPoint_x + width) && mouseY > startPoint_y && mouseY < (startPoint_y + height)){
            return true;
        }
        return false;
    }
}
