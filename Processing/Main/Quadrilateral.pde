class Quadrilateral {
    private float width;
    private float height;
    
    Quadrilateral(float width, float height) {
        this.width = width;
        this.height = height;
    }
    
    public void drawPathBoundary(float topX, float botX, float screenHeight) {
        float x1 = topX * width;
        float x2 = x1 + 0.007353 * width;
        float x4 = botX * width;
        float x3 = x4 + 0.007352 * width;
        
        quad(x1, screenHeight, x2, screenHeight, x3, height, x4, height);
    }
}
