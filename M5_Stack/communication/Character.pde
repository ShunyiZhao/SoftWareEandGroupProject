import java.util.ArrayList;

public class Character extends Entity {
    private ArrayList<RectClass> arrRectangles;
    private ArrayList<EllipseClass> arrEllipses;

    public Character(){
        super();
        arrRectangles = new ArrayList<RectClass>();
        arrEllipses = new ArrayList<EllipseClass>();
    }

    public void insertRectangle(RectClass rectObject){
        arrRectangles.add(rectObject);
    }

    public void insertEllipse(EllipseClass ellipseObject){
        arrEllipses.add(ellipseObject);
    }

    
}
