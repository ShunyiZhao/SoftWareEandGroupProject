import java.util.ArrayList;

class Entity{
    private int initX;
    private int initY;

    private boolean printableMark;

    Entity(){
        initX = 0;
        initY = 0;
        printableMark = false;
    }

    Entity(int inputInitX, int inputInitY, boolean inputMark){
        initX = inputInitX;
        initY = inputInitY;
        printableMark = inputMark;
    }

    public int getInitX(){
        return initX;
    }

    public int getInitY(){
        return initY;
    }

    public void setInitX(int inputX){
        initX = inputX;
    }

    public void setInitY(int inputY){
        initY = inputY;
    }
}
