class Background {
    private float width;
    private float height;
    
    Background(float width, float height) {
        this.width = width;
        this.height = height;
    }
    
    public void setBackground() {
        background(255, 255, 255);
        float screenHeight = drawScreen();
        setPathBoundary(screenHeight);
    }
    
    private void setPathBoundary(float screenHeight) {
        Quadrilateral quadrilateral = new Quadrilateral(width, height);
        quadrilateral.drawPathBoundary(0.3676, 0, screenHeight);
        quadrilateral.drawPathBoundary(0.4265, 0.25, screenHeight);
        quadrilateral.drawPathBoundary(0.4963, 0.4963, screenHeight);
        quadrilateral.drawPathBoundary(0.5522, 0.7353, screenHeight);
        quadrilateral.drawPathBoundary(0.6176, 0.9926, screenHeight);
    }
    
    private float drawScreen() {
        float x = 0.3088 * width;
        float y = 0;
        float screenWidth = 0.3676 * width;
        float screenHeight = 0.3816 * height;
      
        fill(0, 0, 0);
        rect(x, y, screenWidth, screenHeight, 5);
        return screenHeight;
    }
    
}
