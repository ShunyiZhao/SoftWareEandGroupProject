public class RectClass extends ShapeClass {
    int height;
    int width;

    RectClass(){
        super();
        height = 20;
        width = 20;
    }

    RectClass(int inputX, int inputY, int inputHeight, int inputWidth){
        super(inputX, inputY);
        height = inputHeight;
        width = inputWidth;
    }

    public void drawRect(int referenceX, int referenceY){
        rect(referenceX + super.getinitX(), referenceY + super.getinitY(), this.width, this.height);
    }

}
