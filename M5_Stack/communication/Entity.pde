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
}
