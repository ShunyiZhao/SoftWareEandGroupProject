class ellipseButton extends Button{
    private int centerPoint_x;
    private int centerPoint_y;
    private float axis_1;
    private float axis_2;
    
    ellipseButton(int inputX, int inputY, float inputAxis_1, float inputAxis_2, int inputWeight, RGBColour inputStrokeColour, RGBColour inputBColour){
        super(inputWeight, inputStrokeColour, inputBColour);
        centerPoint_x = inputX;
        centerPoint_y = inputY;
        axis_1 = inputAxis_1;
        axis_2 = inputAxis_2;
    }
    
    ellipseButton(int inputX, int inputY, float inputAxis_1, float inputAxis_2){
        super();
        centerPoint_x = inputX;
        centerPoint_y = inputY;
        axis_1 = inputAxis_1;
        axis_2 = inputAxis_2;
    }
    
    public void drawButton(){
        stroke(strokeColour.readR(), strokeColour.readG(), strokeColour.readB());
        strokeWeight(thisWeight);
        noFill();
        ellipse(centerPoint_x, centerPoint_y, axis_1, axis_2);
    }
    
    public boolean checkClickArea(){
        float fdist_1 = mouseX - centerPoint_x;
        float fdist_2 = mouseY - centerPoint_y;
        if((fdist_1 * fdist_1) / (axis_1 * axis_1 / 4) + (fdist_2 * fdist_2) / (axis_2 * axis_2 / 4) < 1){
            return true;
        }
        return false;
    }
}
