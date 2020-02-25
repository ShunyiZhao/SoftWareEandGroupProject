abstract class Button{
    int thisWeight;
    RGBColour strokeColour;
    RGBColour buttonColour;
    
    Button(int inputWeight, RGBColour inputStrokeColour, RGBColour inputBColour){
        thisWeight = inputWeight;
        strokeColour = inputStrokeColour;
        buttonColour = inputBColour;
    }
    
    Button(){
        thisWeight = 2;
        strokeColour = new RGBColour(0, 0, 0);
        buttonColour = new RGBColour(255, 255, 255);
    }
    
    abstract void drawButton();
    abstract boolean checkClickArea();
}
