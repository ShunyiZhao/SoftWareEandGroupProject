public abstract class Drop {
    protected int mode;
    protected int speed;
    protected float startX;
    protected float startY;
    protected float endX;
    protected float endY;
    protected int currentTrack;
    protected int startSize = 50;
    protected int endSize = 100;
    protected float dx;
    protected float dy;
    protected float dsize;
    public boolean reachEnd;
    protected PShape svg;
    
    public Drop(int mode, float startY, float endY, int speed, String filename) {
        this.mode = mode;
        this.startY = startY;
        this.endY = endY - endSize;
        this.speed = speed;
        this.reachEnd = false;
        this.svg = loadShape(filename);
    }
    
    public void getStartEndX(int currentTrack, ArrayList<Integer> topNode, ArrayList<Integer> bottomNode) {
        this.currentTrack = currentTrack;
        int topSpace = topNode.get(1) - topNode.get(0);
        int bottomSpace = bottomNode.get(1) - bottomNode.get(0);
        this.startX = topNode.get(currentTrack - 1) + topSpace / 2 - startSize / 2;
        this.endX = bottomNode.get(currentTrack - 1) + bottomSpace / 2 - endSize / 2;
        getDifferential();      }
        
    protected void getDifferential() {
        float x = (startX - endX) / speed;
        dx = (currentTrack == 1 || currentTrack == 2) ? x : x * (-1);
        dy = (endY - startY) / speed;
        dsize = (endSize - startSize) / speed;
        
    }
    
    public void display() {
        if (frameCount % speed == speed - 1) reachEnd = true; 
        float distance = frameCount % speed * dx;
        float currentX = (currentTrack == 1 || currentTrack == 2) ? startX - distance : startX + distance;
        float currentY = startY + frameCount % speed * dy;
        float currentSize = startSize + frameCount % speed * dsize;
        
        if (currentY <= endY && !reachEnd) 
            shape(svg, currentX, currentY, currentSize, currentSize);
    }
    
}
