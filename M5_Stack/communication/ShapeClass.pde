class ShapeClass{

    private int initX;
    private int initY;

    ShapeClass(){
        initX = 0;
        initY = 0;
    }

    ShapeClass(int inputX, int inputY){
        initX = inputX;
        initY = inputY;
    }

    public int getinitX(){
        return initX;
    }

    public int getinitY(){
        return initY;
    }
    
}
