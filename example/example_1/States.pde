class States{
    PImage img;
    RectButton[] buttons;
    int[] arrNextState;
    int StateID;
    
    States(String imageName, int numButtons, int setID){
        img = loadImage(imageName);
        buttons = new RectButton[numButtons];
        arrNextState = new int[numButtons];
        StateID = setID;
    }
    void createButton(RectButton buttonSet, int nButton, int StateNumber){
        //create buttons;
        buttons[nButton] = buttonSet;
        arrNextState[nButton] = StateNumber;
    }
    void showState(){
        image(img, 0, 0);
        for(int i = 0; i < buttons.length; i++){
            //println(StateID + "--------");
            buttons[i].draw();
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
