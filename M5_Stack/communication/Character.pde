import java.util.ArrayList;

public class Character extends Entity {
    private ArrayList<RectClass> arrRectangles;
    private ArrayList<EllipseClass> arrEllipses;

    public Character(){
        super();
        arrRectangles = new ArrayList<RectClass>();
        arrEllipses = new ArrayList<EllipseClass>();
    }

    public Character(int inputInitX, int inputInitY, boolean inputMark){
        super(inputInitX, inputInitY, inputMark);
        arrRectangles = new ArrayList<RectClass>();
        arrEllipses = new ArrayList<EllipseClass>();
    }

    public void insertRectangle(RectClass rectObject){
        arrRectangles.add(rectObject);
    }

    public void insertEllipse(EllipseClass ellipseObject){
        arrEllipses.add(ellipseObject);
    }

    public void drawCharacter(){
        for(int i = 0; i < arrRectangles.size(); i++){
            this.arrRectangles.get(i).drawRect(super.getInitX(), super.getInitY());
        }
        for(int i = 0; i < arrEllipses.size(); i++){
            this.arrEllipses.get(i).drawEllipse(super.getInitX(), super.getInitY());
        }
    }
    public void moveCharacter(int disX, int disY){
        super.setInitX(super.getInitX() + disX);
        super.setInitY(super.getInitY() + disY);
    }
}
