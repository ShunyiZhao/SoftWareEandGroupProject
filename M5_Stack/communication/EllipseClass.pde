public class EllipseClass extends ShapeClass {
    private int semiAxisX;
    private int semiAxisY;

    public EllipseClass(){
        super();
        semiAxisX = 20;
        semiAxisY = 20;
    }

    public EllipseClass(int inputX, int inputY, int inputAxisX, int inputAxisY){
        super(inputX, inputY);
        semiAxisX = inputAxisX;
        semiAxisY = inputAxisY;
    }

    public void drawEllipse(int referenceX, int referenceY){
        ellipse( referenceX + super.getinitX(), referenceY + super.getinitY(), this.semiAxisX, this.semiAxisY);
    }
}
