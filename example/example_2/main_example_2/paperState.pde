class paperState{
    PImage img;
    rectButton[] buttons;
    int[] arrNextState;
    int StateID;
    
    paperState(String imageName, int numButtons, int setID){
        img = loadImage(imageName);
        buttons = new rectButton[numButtons];
        arrNextState = new int[numButtons];
        StateID = setID;
    }
    void createButton(rectButton buttonSet, int nButton, int StateNumber){
        //create buttons;
        buttons[nButton] = buttonSet;
        arrNextState[nButton] = StateNumber;
    }
    void showState(){
        image(img, 0, 0);
        for(int i = 0; i < buttons.length; i++){
            //println(StateID + "--------");
            buttons[i].drawButton();
        }
    }
    int checkClickNextState(){
        for(int i = 0; i < buttons.length; i++){
            if(buttons[i].checkClickArea()){
                return arrNextState[i];
            }
        }
        return StateID;
    }
    int readID(){
        return StateID;
    }
}
